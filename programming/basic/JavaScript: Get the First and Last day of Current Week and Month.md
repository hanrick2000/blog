#### Get the First and Last day of Current Week
The basic idea is to use getDate() and getDay(), and get the difference of current date and the first or last day of this week.

- getDate() returns the day of the month (from 1 to 31) for the specified date.
- getDay() returns the day of the week (from 0 to 6) for the specified date.

``` {.javascript .numberLines .lineAnchors}
function getMondayOfCurrentWeek(d)
{
    var day = d.getDay();
    return new Date(d.getFullYear(), d.getMonth(), d.getDate() + (day == 0?-6:1)-day );
}
function getSundayOfCurrentWeek(d)
{
    var day = d.getDay();
    return new Date(d.getFullYear(), d.getMonth(), d.getDate() + (day == 0?0:7)-day );
}
```

#### Get the First and Last day of Current Month
``` {.javascript .numberLines .lineAnchors}
function getFirstDayOfCurrentMonth(d){
  return new Date(d.getFullYear(), d.getMonth(), 1);
}
function getLastDayOfCurrentMonth(d){
  return new Date(d.getFullYear(), d.getMonth()+1, 0);
}
```

#### Get String in yyyy-mm-dd Format
``` {.javascript .numberLines .lineAnchors}
function yymmdd(dataObj){
  var month = (dataObj.getMonth()+1);
  var monthStr = month<10? ('0' + month): month;
  var dateStr = dataObj.getDate()< 10? ('0' + dataObj.getDate()): dataObj.getDate();
  return dataObj.getFullYear() + "-" + monthStr + "-" + dateStr;
}
```