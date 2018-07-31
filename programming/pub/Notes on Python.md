### pyCharm
#### Change Navigate -> Declaration shortcut to Cmd+click by Adding Mouse Shortcut
- Original Ctrl+Click conflicts Mac's right click

#### Assign Cmd+F to Find
#### Pass command arguments to python
- Run->Edit configurations->"+" (add new config)->Python -> add Script params

#### Use requirements.txt to install dependences
- if failed, run ./venv/bin/pip install -r requirements.txt in Terminal

##### Use ToolBox to upgrade pyCharm
##### [Inspect long collection](https://stackoverflow.com/questions/35067932/pycharm-a-python-ide-can-only-show-the-first-300-members-of-a-list)
- Evaluate expression: print(list)

#### Add folder as source folder

### Python
#### [Prefer to use str.format over %](https://realpython.com/python-string-formatting/)
- % may throw error
  - not enough arguments for format string
  - not all arguments converted during string formatting
#### [List functions in a module](https://stackoverflow.com/questions/139180/how-to-list-all-functions-in-a-python-module)
- [dir(modulename)](https://docs.python.org/3/library/functions.html#dir)
- help(modulename)

#### is vs ==
- == checks equality, is checks identities

##### sys.argv
- list of strings representing the arguments
- sys.argv[0]: name of the script

#### os.chdir("../..")
- Don't change current directory
- Don't change state, hard to test, bug

#### Execute external commands
- [If passing a single string, either shell must be True or else the string must simply name the program to be executed without specifying any arguments.](https://stackoverflow.com/questions/18962785/oserror-errno-2-no-such-file-or-directory-while-using-python-subprocess-in-dj)
```python
import subprocess
subprocess.check_call("git clone --depth 1 -b master " + git_repo, cwd=tmp_folder, shell=True)
commit_id = subprocess.check_output(["git log --pretty=format:%H"], cwd=git_repo_folder, shell=True)

import shlex
subprocess.call(shlex.split(crop))
```
#### Gotcha
- Python doesn't support ++

#### Tools
python -m SimpleHTTPServer\
| python -mjson.tool

#### Installing a different python 2.7
sudo yum install python27\
rpm -ql python2.7-stack-2.7.12-1.9.g680e0d1.x86_64\
/opt/python-2.7/bin/python

#### Pip
##### [PIP Install on Mac: Operation Not Permitted](http://marcelog.github.io/articles/mac_osx_python_pip_install_operation_not_permitted.html)
- pip install <package> --user
    - install the package into your own home directory

##### [pip install --ignore-installed six](https://github.com/pypa/pip/issues/3165)
<!-- pip install --ignore-installed six --user


sudo yum -y install gcc gcc-c++\
sudo yum -y install python-devel libffi-devel openssl-devel\
/opt/python-2.7/bin/python -m ensurepip --default-pip\
/opt/python-2.7/bin/python  -m pip install requests[security] --user\
pip install --upgrade pip -->

#### Debugging
##### pudb
python2.7 -m pip install pudb\
python2.7 -m pudb.run s.py

#### [logging](https://docs.python.org/2/howto/logging.html)

#### [\*args and \*\*kwargs](https://stackoverflow.com/questions/36901/what-does-double-star-asterisk-and-star-asterisk-do-for-parameters)
- [The \*args will give you all function parameters as a tuple](http://book.pythontips.com/en/latest/args_and_kwargs.html)
- The \*\*kwargs will give you all keyword arguments except for those corresponding to a formal parameter as a dictionary.
- \*l idiom is to unpack argument lists when calling a function
```python
def greet_me(**kwargs):
    for key, value in kwargs.items():
        print("{0} = {1}".format(key, value))
```

##### [Modules](https://docs.python.org/3/tutorial/modules.html#packages)
- [__main__.py to to create executables for zipfile for folder](https://gist.github.com/rochacbruno/ed19c5d9ba9bb50391a2)
```python
# the main method in python
if __name__ == "__main__":
    # execute only if run as a script
    main()
```

#### [Unit test](https://cpython-test-docs.readthedocs.io/en/latest/library/unittest.mock-examples.html)
- [Patch multiple methods from a module or class](https://stackoverflow.com/questions/29318987/preferred-way-of-patching-multiple-methods-in-python-unit-test)
- Class Attributes vs Instance Attributes
```python
class MyClass(object):
    class_var = 1
    def __init__(self, i_var):
        self.i_var = i_var
    def method(self):
      another_method(MyClass.class_var, self.i_var)
```
```python
import unittest
class XTestClass(unittest.TestCase):
  @classmethod
  def setUpClass(cls):
  @classmethod
  def tearDownClass(cls):
if __name__ == '__main__':
    unittest.main()
from unittest.mock import Mock
# for python 2.7: import mock
@mock.patch("my_module.method_to_mock")

# Change return value for each call
mock_method.side_effect = ['foo', 'bar', 'baz']
@patch("foo.load",side_effects=["a","b","c"])

self.assertRaises(XException, func)
# Capture Exception
with self.assertRaises(TypeError) as cm:
    failure.fail()
self.assertEqual('expected error message',str(cm.exception))

self.assertRaisesRegexp(ValueError, 'error message pattern', int, 'XYZ')
with self.assertRaisesRegexp(ValueError, 'error message pattern'):
    int('XYZ')

# Assert method not called
assert not func.called, 'method should not have been called'
self.assertFalse(mock_method.called)

mock.assert_called_with(args_value) 

# Patch multiple methods from a module or class
with patch.multiple(simulator,
        ma=DEFAULT,mb=DEFAULT,
        autospec=True) as mocks:

# Mock methods manually
simulator.ma = create_autospec(simulator.ma)
simulator.mb = create_autospec(simulator.mb)

@patch.object(XClass, 'ma', autospec=True)
@patch.object(XClass, 'mb', autospec=True)
@patch.object(XClass, '_handle_set_watchdog', autospec=True)
```

#### Misc
- [__init__.py to make Python treat the directories as containing packages](https://docs.python.org/3/tutorial/modules.html#packages)
```python
TypeError: cannot concatenate 'str' and 'dict' objects
print "web_response=", web_response

def log(self, msg):
    print "{} {}".format(time.strftime("%Y-%m-%d %H:%M"), msg)
    
# difference syntax compared with java
if condition_a or cb and not (ca)
a is not None

for iterating_var in sequence:
   statements(s)

raise Exception(msg)
 try:
 except: 
     print "oh dear"
 except TypeError,e:
     print "dealing with TypeError"
 except IndexError, e:
     print "dealing with IndexError"
 finally:
     print "the end"
# Custom exception
 class CarError(Exception):
     def __init__(self, car, msg=None):
         super(CarError, self).__init__(msg)
         self.car = car
# Merge two dicts into a new one
z = x.copy()   # start with x's keys and values
z.update(y)    # modifies z with y's keys and values & returns None

# Utility functions for copying and archiving files and directory trees.
import shutil
shutil.rmtree("the_folder")

os.path.exists(directory)
os.makedirs(directory)

# Use pass for no-op

# Parse file - https://stackabuse.com/read-a-file-line-by-line-in-python/
with open(filepath) as fp:  
   for cnt, line in enumerate(fp):
       print("Line {}: {}".format(cnt, line))      
with open(filepath) as fp:  
  line = fp.readline()
  while line:
      line = fp.readline()
      
global globvar    # use global to declare the variable in function when need modify it
globvar = 1

if not alist: #check list is not empty
len(aList)
```