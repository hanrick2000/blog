### pyCharm
#### Pass command arguments to python
- Run->Edit configurations->"+" (add new config)->Python -> add Script params


### Python
#### is vs ==
- == checks equality, is checks identities

##### sys.argv
- list of strings representing the arguments
- sys.argv[0]: name of the script

#### os.chdir("../..")
- Don't change current directory
- Don't change state, hard to test, bug

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
pip install --ignore-installed six --user


sudo yum -y install gcc gcc-c++\
sudo yum -y install python-devel libffi-devel openssl-devel\
/opt/python-2.7/bin/python -m ensurepip --default-pip\
/opt/python-2.7/bin/python  -m pip install requests[security] --user\
pip install --upgrade pip

#### Debugging
##### pudb
python2.7 -m pip install pudb\
python2.7 -m pudb.run s.py


#### Misc
```python
# the main method in python
if __name__ == "__main__":
    # execute only if run as a script
    main()
TypeError: cannot concatenate 'str' and 'dict' objects
print "web_response=", web_response

def log(self, msg):
    print "{} {}".format(time.strftime("%Y-%m-%d %H:%M"), msg)
```