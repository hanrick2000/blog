#### The Problem
Sometimes we need support export data as CSV file, so people can download it and open it in excel and do some analysis.

#### The Data
The data we want to export it as below:

```java
public class SurveyAnswers{
    public String surveyId;
    // some other meta data about survey, user
    public List<QuestionAnswer> answers;
}
// user's choice for this question
public class QuestionAnswer {
    public int questionId;
    public int optionId;
    // other meta data about the question and the option
}
```

The date in CSV file would be like this:

> `SurveyId, dataTime, /*fields about user meta data */, QuestionId1, AnswerId1, QuestionId2, AnswerId2...`

The difficult part is that field headers are not fixed due to the list of QuestionAnswer.

#### Choose CSV Library
I choose [Super-CSV](https://super-csv.github.io/super-csv/examples_writing.html){target="blank"}, as we want to use its CsvMapWriter. We will convert the data to a hashmap, which contains fields like: QuestionId1, AnswerId1, QuestionId2, AnswerId2 etc.

Check more about superCSV at [Writing CSV files](https://super-csv.github.io/super-csv/examples_writing.html){target="blank"}

//Update:

It's better to use [CsvDozerBeanReader for our use case](https://super-csv.github.io/super-csv/examples_dozer.html){target="blank"}.

#### CsvBeanWritable Interface
In most cases, we are going to implement this interface.

``` {.java .numberLines .lineAnchors}
/**
 * Check: http://stackoverflow.com/questions/21942042/using-supercsv-to-change-header-values
 *
 */
public interface CsvBeanWritable {
    /**
     * Header in csv file - it can be anything such as

     * new String[] { "First Name", "Last Name", "Birthday"};
     */
    @JsonIgnore
    public String[] getCsvHeader();
    /**
     * The mapping of bean field to cvv field - order matters

     * new String[] { "firstName", "lastName", "birthDate"};
     */
    @JsonIgnore
    public String[] getCsvMapping();
}
```

#### CsvMapWritable Interface
- When logic is complex like in our case, we can't use CsvBeanWriter, we will implement CsvMapWritable interface.
- CsvMessageBodyWriter will use superCSV CsvMapWriter to write the object as csv data.

``` {.java .numberLines .lineAnchors}
public interface CsvMapWritable {
    @JsonIgnore
    public Map<String, Object> getCsvBody();
    @JsonIgnore
    public String[] getCsvHeader();
}
CsvMessageBodyWriter - the Provider
CsvMessageBodyWriter  will marshall object as csv data if the object implements CsvBeanWritable or CsvMapWritable, of the object is a collection of CsvBeanWritable or CsvMapWritable.
```

We need register it in ResourceConfig or tell jersey to scan the package to find it.
``` {.java .numberLines .lineAnchors}
@Component
@Provider
@Produces({CsvMessageBodyWriter.TEXT_CSV, CsvMessageBodyWriter.APPLICATION_EXCEL})
public class CsvMessageBodyWriter<T> implements MessageBodyWriter<T> {
    public static final String TEXT_CSV = "text/csv";
    public static final String APPLICATION_EXCEL = "application/vnd.ms-excel";

    @Override
    public boolean isWriteable(final Class<?> type, final Type genericType, final Annotation[] annotations,
            final MediaType mediaType) {
        return true;
    }
    @Override
    public long getSize(final T data, final Class<?> type, final Type genericType, final Annotation annotations[],
            final MediaType mediaType) {
        return -1;
    }
    @Override
    public void writeTo(final T data, final Class<?> type, final Type genericType, final Annotation[] annotations,
            final MediaType mediaType, final MultivaluedMap<String, Object> httpHeaders,
            final OutputStream entityStream) throws java.io.IOException, javax.ws.rs.WebApplicationException {
        try (AbstractCsvWriter csvWriter = getCsvWriter(data, entityStream)) {
            writeDate(data, csvWriter);
        }
    }
    private AbstractCsvWriter getCsvWriter(final T data, final OutputStream entityStream) {
        AbstractCsvWriter csvWriter = null;
        if (data instanceof CsvBeanWritable) {
            csvWriter = new CsvBeanWriter(new OutputStreamWriter(entityStream), CsvPreference.STANDARD_PREFERENCE);
        } else if (data instanceof CsvMapWritable) {
            csvWriter = new CsvMapWriter(new OutputStreamWriter(entityStream), CsvPreference.STANDARD_PREFERENCE);
        } else if (data instanceof Collection) {
            final Collection<?> collection = (Collection<?>) data;
            csvWriter = getCsvWritterFromCollection(collection, entityStream);
        }
        return csvWriter;
    }


    protected void writeDate(final T data, final AbstractCsvWriter csvWriter) throws IOException {
        if (data instanceof CsvBeanWritable) {
            final CsvBeanWritable writable = (CsvBeanWritable) data;
            csvWriter.writeHeader(writable.getCsvHeader());
            ((CsvBeanWriter) csvWriter).write(writable, writable.getCsvMapping());
        } else if (data instanceof CsvMapWritable) {
            final CsvMapWritable writable = (CsvMapWritable) data;
            csvWriter.writeHeader(writable.getCsvHeader());
            ((CsvMapWriter) csvWriter).write(writable.getCsvBody(), writable.getCsvHeader());
        } else if (data instanceof Collection) {
            writeCollection(data, csvWriter);
        } else {
            throw new XXException("doesn't support download as csv");
        }
    }

    protected void writeCollection(final T data, final AbstractCsvWriter csvWriter) throws IOException {
        final Collection<?> collection = (Collection<?>) data;
        boolean first = true;
        final Iterator<?> it = collection.iterator();
        while (it.hasNext()) {
            final Object obj = it.next();
            if (CsvBeanWritable.class.isAssignableFrom(obj.getClass())) {
                final CsvBeanWritable writable = (CsvBeanWritable) obj;
                if (first) {
                    csvWriter.writeHeader(writable.getCsvHeader());
                    first = false;
                }
                ((CsvBeanWriter) csvWriter).write(writable, writable.getCsvMapping());
            } else if (CsvMapWritable.class.isAssignableFrom(obj.getClass())) {
                final CsvMapWritable writable = (CsvMapWritable) obj;
                if (first) {
                    csvWriter.writeHeader(writable.getCsvHeader());
                    first = false;
                }
                ((CsvMapWriter) csvWriter).write(writable.getCsvBody(), writable.getCsvHeader());
            } else {
                throw new XXException("doesn't support download as csv");
            }
        }
    }
    protected static AbstractCsvWriter getCsvWritterFromCollection(final Collection<?> collection,
            final OutputStream entityStream) {
        AbstractCsvWriter csvWriter = null;
        final Iterator<?> it = collection.iterator();
        while (it.hasNext()) {
            final Object obj = it.next();
            if (CsvMapWritable.class.isAssignableFrom(obj.getClass())) {
                csvWriter = new CsvMapWriter(new OutputStreamWriter(entityStream), CsvPreference.STANDARD_PREFERENCE);
            } else if (CsvBeanWritable.class.isAssignableFrom(obj.getClass())) {
                csvWriter = new CsvBeanWriter(new OutputStreamWriter(entityStream), CsvPreference.STANDARD_PREFERENCE);
            }
        }
        return csvWriter;
    }
}
```

#### Add CSV ability to API
``` {.java .numberLines .lineAnchors}
 * @param downloadAsFile: downloadAsFile=false, it seems not work in chrome, only work in safari,
 *        not try safari.
@GET
@Produces({MediaType.APPLICATION_JSON, CsvMessageBodyWriter.TEXT_CSV})
public Set getFlatSurveyChoiceResponse(@QueryParam("surveyId") final String surveyId,
        @QueryParam("downloadAsFile") @DefaultValue("true") final boolean downloadAsFile) {
    if (downloadAsFile) {
        servletResponse.addHeader("Content-Disposition", MessageFormat.format("attachment; filename={0}.csv",
                DateUtil.getThreadLocalDateFormat().format(new Date())));
    }
    return service.getSurveyAnswers(surveyId);
}
```

#### Using CsvMapWritable in our SurveyAnswers example

Create csv headers for this survey and add it into SurveyHeadersHolder.
``` {.java .numberLines .lineAnchors}
for (final Integer questionId : questions) {
    extraHeaders.add(getQuestionIDHeader(questionId));
    extraHeaders.add(getQuestionTitleHeader(questionId));
    extraHeaders.add(getOptionIDHeader(questionId));
    extraHeaders.add(getOptionTextHeader(questionId));
}
```
SurveyHeadersHolder.INSTANCE.addSurveyHeaders(surveyId, extraHeaders);

#### Implementing CsvMapWritable in SurveyAnswers
``` {.java .numberLines .lineAnchors}
@Override
public Map<String, Object> getCsvBody() {
    final Map<String, Object> map = new LinkedHashMap<>();
    map.put(HEADER_SURVEY_ID, surveyId);
    map.put(HEADER_DATE, DateUtil.getThreadLocalDateFormat().format(date));
    for (final SurveyAnswers answer : answers) {
        map.put(getQuestionIDHeader(answer.getQuestionId()), answer.getQuestionId());
        map.put(getQuestionTitleHeader(answer.getQuestionId()), answer.getQuestionText());
        map.put(getOptionIDHeader(answer.getQuestionId()), answer.getOptionId());
        map.put(getOptionTextHeader(answer.getQuestionId()), answer.getOptionText());
    }
    return map;
}

@Override
public String[] getCsvHeader() {
    return SurveyHeadersHolder.INSTANCE.getSurveyHeaders(surveyId);
}
```