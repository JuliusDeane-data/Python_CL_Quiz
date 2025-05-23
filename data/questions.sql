INSERT INTO general (question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, topic_1, topic_2) VALUES
('What is the output of print(2 ** 3)?', '8', '6', '9', '5', 1, 1, NULL),
('Which of the following is a valid variable name in Python?', 'my_variable', '2variable', 'my-variable', 'class', 1, 1, NULL),
('What function is used to get input from the user in Python?', 'input()', 'get()', 'read()', 'scan()', 1, 1, NULL),
('Which keyword is used to define a function in Python?', 'def', 'func', 'define', 'method', 1, 1, NULL),
('What will print(len("Python")) output?', '6', '5', '7', 'Error', 1, 1, NULL),

('What is the result of 10 // 3 in Python?', '3', '3.33', '4', 'Error', 2, 1, NULL),
('Which of these data types is immutable in Python?', 'tuple', 'list', 'dictionary', 'set', 2, 1, NULL),
('How do you open a file in write mode?', 'open("file.txt", "w")', 'open("file.txt", "r")', 'open("file.txt", "a")', 'open("file.txt", "wb")', 2, 1, NULL),
('What does the "continue" statement do in a loop?', 'Skips the current iteration', 'Exits the loop', 'Pauses execution', 'Restarts the loop', 2, 1, NULL),
('Which module is used for working with JSON data in Python?', 'json', 'pickle', 'os', 'csv', 2, 1, NULL),

('What is the output of bool([])?', 'False', 'True', 'None', 'Error', 3, 1, NULL),
('Which method is used to remove an item from a dictionary?', 'pop()', 'remove()', 'delete()', 'discard()', 3, 1, NULL),
('What is the time complexity of searching for an element in a set?', 'O(1)', 'O(n)', 'O(log n)', 'O(n^2)', 3, 1, NULL),
('How do you sort a list in descending order?', 'sorted(my_list, reverse=True)', 'my_list.sort(descending=True)', 'my_list.sorted(reverse=True)', 'sort(my_list, desc=True)', 3, 1, NULL),
('Which function is used to get the memory address of an object?', 'id()', 'address()', 'memory()', 'ptr()', 3, 1, NULL),

('What will be the output of print({1, 2, 3} & {2, 3, 4})?', '{2, 3}', '{1, 2, 3, 4}', '{1, 4}', 'Error', 5, 1, NULL),
('Which of the following is a correct way to create a NumPy array?', 'np.array([1, 2, 3])', 'numpy.list([1, 2, 3])', 'array.numpy([1, 2, 3])', 'numpy.create([1, 2, 3])', 5, 1, NULL),
('What does the zip() function return?', 'An iterator of tuples', 'A list of tuples', 'A dictionary', 'A set', 5, 1, NULL),
('Which of these functions can be used to check if an object is an instance of a class?', 'isinstance()', 'issubclass()', 'type()', 'checkclass()', 5, 1, NULL),
('How can you measure the execution time of a Python script?', 'Using time.time() or timeit', 'Using sys.clock()', 'Using datetime.now()', 'Using timer()', 5, 1, NULL),

('What is the result of print(sorted([3, 1, 4], key=lambda x: -x))?', '[4, 3, 1]', '[1, 3, 4]', '[3, 1, 4]', 'Error', 5, 1, NULL),
('How do you create a dictionary comprehension?', '{k: v for k, v in iterable}', '[k: v for k, v in iterable]', '{(k, v) for k, v in iterable}', 'dict(k: v for k, v in iterable)', 5, 1, NULL),
('Which method in Pandas is used to drop missing values?', 'dropna()', 'remove()', 'delete()', 'clean()', 5, 1, NULL),
('How do you perform element-wise multiplication on two NumPy arrays?', 'array1 * array2', 'array1.dot(array2)', 'multiply(array1, array2)', 'elementwise(array1, array2)', 5, 1, NULL),
('Which of these decorators is used to define a static method?', '@staticmethod', '@classmethod', '@property', '@abstractmethod', 5, 1, NULL);

INSERT INTO general (question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, topic_1, topic_2) VALUES
-- Difficulty 1 (Beginner)
('What is the correct way to start a comment in Python?', '# This is a comment', '// This is a comment', '/* This is a comment */', '-- This is a comment', 1, 1, NULL),
('Which function is used to find the length of a string?', 'len()', 'length()', 'size()', 'count()', 1, 1, NULL),
('What will print(type(42)) output?', '<class ''int''>', '<class ''float''>', '<class ''str''>', '<class ''bool''>', 1, 1, NULL),
('Which keyword is used to create a loop that executes while a condition is true?', 'while', 'for', 'loop', 'repeat', 1, 1, NULL),
('What is the output of print(3 * "Hello")?', 'HelloHelloHello', 'Hello3', '3Hello', 'Error', 1, 1, NULL),
('Which of the following is not a valid Python data type?', 'character', 'integer', 'boolean', 'string', 1, 1, NULL),
('What is the default return value of a function that does not return anything?', 'None', '0', 'False', 'Empty string', 1, 1, NULL),
('Which operator is used to check equality in Python?', '==', '=', '!=', '===', 1, 1, NULL),
('Which function converts a string to an integer?', 'int()', 'str()', 'float()', 'bool()', 1, 1, NULL),
('What will be the output of print(10 % 3)?', '1', '3', '0', '10', 1, 1, NULL),

-- Difficulty 2 (Easy)
('What will be the output of print(bool([]))?', 'False', 'True', 'None', 'Error', 2, 1, NULL),
('How do you check the data type of a variable?', 'type(variable)', 'datatype(variable)', 'checktype(variable)', 'typeof(variable)', 2, 1, NULL),
('Which method is used to remove the last item from a list?', 'pop()', 'remove()', 'del()', 'discard()', 2, 1, NULL),
('How do you write an infinite loop in Python?', 'while True:', 'for i in range():', 'loop:', 'while 1==2:', 2, 1, NULL),
('Which built-in function returns the absolute value of a number?', 'abs()', 'round()', 'floor()', 'ceil()', 2, 1, NULL),
('How do you combine two lists in Python?', 'list1 + list2', 'combine(list1, list2)', 'merge(list1, list2)', 'list1.append(list2)', 2, 1, NULL),
('What is the output of print("python".capitalize())?', 'Python', 'PYTHON', 'python', 'P', 2, 1, NULL),
('Which symbol is used for single-line comments in Python?', '#', '//', '--', '/* */', 2, 1, NULL),
('How do you remove leading and trailing spaces from a string?', 'strip()', 'trim()', 'cut()', 'remove()', 2, 1, NULL),
('What does the enumerate() function do?', 'Adds an index to an iterable', 'Sorts a list', 'Converts a string to a list', 'Reverses a list', 2, 1, NULL),

-- Difficulty 3 (Intermediate)
('What is the time complexity of appending an element to a list in Python?', 'O(1)', 'O(n)', 'O(log n)', 'O(n^2)', 3, 1, NULL),
('Which of the following is not a Python keyword?', 'switch', 'yield', 'with', 'pass', 3, 1, NULL),
('What does the zip() function do?', 'Combines multiple iterables into tuples', 'Compresses a file', 'Joins strings', 'Sorts a list', 3, 1, NULL),
('Which of the following data structures allows duplicate values?', 'list', 'set', 'dictionary', 'tuple', 3, 1, NULL),
('Which method is used to check if a key exists in a dictionary?', 'in', 'exists()', 'contains()', 'has_key()', 3, 1, NULL),
('What will be the output of print({1, 2, 3} | {3, 4, 5})?', '{1, 2, 3, 4, 5}', '{3}', '{1, 2, 5}', 'Error', 3, 1, NULL),
('Which function is used to iterate over both index and value in a list?', 'enumerate()', 'range()', 'zip()', 'map()', 3, 1, NULL),
('What is the output of print("10".zfill(4))?', '0010', '0100', '1000', 'Error', 3, 1, NULL),
('Which operator is used for unpacking in Python?', '*', '&', '@', '$', 3, 1, NULL),
('What is the default value of the end parameter in print()?', 'newline (''\\n'')', 'space (" ")', 'dot (".")', 'None', 3, 1, NULL),

-- Difficulty 5 (Advanced)
('What is the output of print(sorted({3: "a", 1: "b", 2: "c"}))?', '[1, 2, 3]', '["a", "b", "c"]', '[3, 1, 2]', 'Error', 5, 1, NULL),
('What does the __slots__ attribute do in a class?', 'Limits the attributes that an instance can have', 'Deletes unused attributes', 'Defines private variables', 'Enforces data types', 5, 1, NULL),
('What does the "@" symbol do in Python?', 'Defines a decorator', 'Performs matrix multiplication', 'Creates a pointer', 'Declares a lambda function', 5, 1, NULL),
('Which of the following is true for Python’s Global Interpreter Lock (GIL)?', 'It allows only one thread to execute at a time', 'It improves multithreading performance', 'It applies to multiprocessing', 'It is present in all Python implementations', 5, 1, NULL),
('How does Python handle integer overflow?', 'Automatically converts to long integers', 'Throws an OverflowError', 'Wraps around like C', 'Converts to float', 5, 1, NULL),
('Which of the following is used to define an abstract method?', '@abstractmethod', '@classmethod', '@staticmethod', '@final', 5, 1, NULL),
('What is the output of print({1, 2, 3} & {2, 3, 4})?', '{2, 3}', '{1, 2, 3, 4}', '{1, 4}', 'Error', 5, 1, NULL),
('Which method in Pandas is used to fill missing values?', 'fillna()', 'replace()', 'impute()', 'fill()', 5, 1, NULL),
('Which library is used for working with regular expressions in Python?', 're', 'regex', 'regexp', 'string', 5, 1, NULL),
('What is the difference between deep copy and shallow copy?', 'Deep copy creates independent copies', 'Shallow copy copies references only', 'Shallow copy duplicates objects completely', 'They are the same', 5, 1, NULL);


INSERT INTO q_general (question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, topic_1, topic_2) VALUES
-- Difficulty 1
('Which of the following is used to output something in Python?', 'print()', 'echo()', 'console.log()', 'printf()', 1, 1, NULL),
('How do you assign the value 10 to a variable called x?', 'x = 10', 'int x = 10', 'x := 10', 'let x = 10', 1, 1, NULL),
('Which keyword is used to define a function?', 'def', 'func', 'function', 'define', 1, 1, NULL),
('Which symbol is used to multiply numbers in Python?', '*', 'x', '^', '×', 1, 1, NULL),
('How do you write a string in Python?', '"text"', '`text`', '[text]', '(text)', 1, 1, NULL),
('What does the input() function do?', 'Reads user input', 'Prints output', 'Stops program', 'Clears screen', 1, 1, NULL),
('Which of the following is a boolean value in Python?', 'True', '"true"', '1', 'Yes', 1, 1, NULL),
('What will be the output of print(2 + 3)?', '5', '23', '6', 'Error', 1, 1, NULL),
('Which of these is used to store multiple values in order?', 'list', 'int', 'bool', 'str', 1, 1, NULL),
('How do you start an if-statement in Python?', 'if condition:', 'if (condition) then', 'if condition then', 'when condition', 1, 1, NULL),
('What does indentation indicate in Python?', 'Code block', 'Comment', 'Loop', 'Nothing', 1, 1, NULL),
('Which data type is used for decimal numbers?', 'float', 'int', 'decimal', 'double', 1, 1, NULL),

-- Difficulty 2
('What is the result of 5 // 2 in Python?', '2', '2.5', '3', 'Error', 2, 1, NULL),
('How do you define a list in Python?', '[1, 2, 3]', '{1, 2, 3}', '(1, 2, 3)', '<1, 2, 3>', 2, 1, NULL),
('Which method adds an item to the end of a list?', 'append()', 'insert()', 'add()', 'push()', 2, 1, NULL),
('Which function converts a float to an int?', 'int()', 'float()', 'str()', 'bool()', 2, 1, NULL),
('What is the result of "3" + "4"?', '"34"', '7', 'Error', '12', 2, 1, NULL),
('Which function returns the largest value from a list?', 'max()', 'top()', 'biggest()', 'largest()', 2, 1, NULL),
('How do you write an else-if condition?', 'elif', 'elseif', 'else if', 'ifelse', 2, 1, NULL),
('What does the range(3) function return?', '[0, 1, 2]', '[1, 2, 3]', '[0, 1, 2, 3]', '[1, 2]', 2, 1, NULL),
('What is the purpose of the continue statement?', 'Skips to next iteration', 'Ends loop', 'Pauses program', 'Repeats iteration', 2, 1, NULL),
('Which symbol is used for exponentiation?', '**', '^', 'exp()', '^^', 2, 1, NULL),
('How do you access the first item in a list `mylist`?', 'mylist[0]', 'mylist(1)', 'mylist{0}', 'mylist.1', 2, 1, NULL),
('Which of the following can be used as keys in a dictionary?', 'Immutable types', 'Lists', 'Sets', 'All data types', 2, 1, NULL),

-- Difficulty 3
('What will be the output of bool(0)?', 'False', 'True', 'None', 'Error', 3, 1, NULL),
('What is the difference between == and is?', '== compares values, is compares identity', 'They are the same', '== checks identity', 'is compares types', 3, 1, NULL),
('Which built-in function returns the memory location of an object?', 'id()', 'loc()', 'mem()', 'addr()', 3, 1, NULL),
('What is a lambda function?', 'Anonymous function', 'Built-in function', 'Decorator', 'Class method', 3, 1, NULL),
('How do you define a tuple?', '(1, 2, 3)', '[1, 2, 3]', '{1, 2, 3}', 'tuple(1, 2, 3)', 3, 1, NULL),
('Which statement is used to handle exceptions?', 'try...except', 'try...catch', 'if...error', 'test...fail', 3, 1, NULL),
('Which method removes all items from a list?', 'clear()', 'remove()', 'delete()', 'empty()', 3, 1, NULL),
('Which keyword is used to inherit from a class?', 'class Child(Base):', 'class Child < Base:', 'inherit Base', 'extends Base', 3, 1, NULL),
('How do you read a file line by line in Python?', 'for line in file:', 'while file.read():', 'file.readlines()', 'loop file', 3, 1, NULL),
('Which method converts a string to lowercase?', 'lower()', 'down()', 'small()', 'min()', 3, 1, NULL),
('What will len(set([1,2,2,3])) return?', '3', '4', '2', '1', 3, 1, NULL),
('What happens if you access a non-existent key in a dictionary using square brackets?', 'KeyError', 'None', 'False', 'Empty string', 3, 1, NULL),

-- Difficulty 5
('Which of these statements defines a generator?', 'yield', 'return', 'async', 'pass', 5, 1, NULL),
('What is a metaclass in Python?', 'A class of a class', 'A special decorator', 'A type hint', 'A memory model', 5, 1, NULL),
('How do you create a virtual environment in Python 3?', 'python3 -m venv env', 'virtualenv3 env', 'py -new env', 'pip install env', 5, 1, NULL),
('What will be the result of: [i for i in range(5) if i % 2 == 0]?', '[0, 2, 4]', '[1, 3]', '[0, 1, 2, 3, 4]', '[2, 4]', 5, 1, NULL),
('What does functools.lru_cache do?', 'Caches function return values', 'Logs recent usage', 'Speeds up disk I/O', 'Tracks recursion depth', 5, 1, NULL),
('How do you define an asynchronous function?', 'async def func():', 'def async func():', 'await def func():', 'def func() async:', 5, 1, NULL),
('What is monkey patching?', 'Changing behavior at runtime', 'Fixing a syntax bug', 'Patching a memory leak', 'Binding methods at compile time', 5, 1, NULL),
('How are Python lists stored in memory?', 'As dynamic arrays', 'As linked lists', 'As static arrays', 'As hash tables', 5, 1, NULL),
('What is the purpose of __name__ == "__main__"?', 'To execute code only when script is run directly', 'To check for module import', 'To define entry point in all Python scripts', 'To declare a class name', 5, 1, NULL),
('What does "nonlocal" do in nested functions?', 'Modifies variable in enclosing scope', 'Creates a global variable', 'Declares a class-level variable', 'Ignores variable in outer scope', 5, 1, NULL),
('What is the output of print({1,2,3}.difference({2,3,4}))?', '{1}', '{2, 3}', '{4}', 'Error', 5, 1, NULL),
('How do you safely open a file for reading?', 'with open("file.txt", "r") as f:', 'open("file.txt")', 'read("file.txt")', 'file("file.txt").open()', 5, 1, NULL),
('What is the main purpose of the `__init__` method in a class?', 'Initialize object attributes', 'Allocate memory', 'Import modules', 'Declare variables', 5, 1, NULL);


INSERT INTO q_classes (question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, topic_1, topic_2) VALUES
-- Difficulty 1
('What keyword is used to define a class in Python?', 'class', 'def', 'object', 'function', 1, 1, NULL),
('What is the name of the method used to initialize an object?', '__init__', '__start__', '__create__', 'init()', 1, 1, NULL),
('How do you create a new object from a class named Dog?', 'my_dog = Dog()', 'Dog = my_dog()', 'create Dog()', 'Dog.my_dog()', 1, 1, NULL),
('Which keyword refers to the current object inside a class?', 'self', 'this', 'me', 'current', 1, 1, NULL),
('What symbol is used to access attributes or methods?', '.', '->', ':', '@', 1, 1, NULL),
('Which method is called when an object is created?', '__init__', '__new__', '__create__', 'start()', 1, 1, NULL),
('How do you define a class named Car?', 'class Car:', 'Car class:', 'def Car:', 'new class Car:', 1, 1, NULL),
('Which of these is a class attribute?', 'Defined outside __init__', 'Defined inside __init__', 'Passed to __init__ only', 'Stored in a list', 1, 1, NULL),
('What does object-oriented programming use?', 'Classes and objects', 'Functions only', 'Lists and tuples', 'Just logic', 1, 1, NULL),
('Which of the following creates an instance variable?', 'self.name = "Tom"', 'name = "Tom"', '__name = "Tom"', 'this.name = "Tom"', 1, 1, NULL),
('What is the result of type(my_obj) if my_obj is an instance of MyClass?', '<class ''MyClass''>', '<type ''object''>', '<obj ''MyClass''>', 'MyClass()', 1, 1, NULL),
('Can you define a class with no members?', 'Yes, using pass', 'No', 'Only in Python 3+', 'Only with return', 1, 1, NULL),

-- Difficulty 2
('How can you access an attribute "name" of an object "person"?', 'person.name', 'person->name', 'person:name', 'name.person', 2, 1, NULL),
('What does __str__ return?', 'A string representation of the object', 'Object type', 'Object address', 'A class name', 2, 1, NULL),
('What is true about instance variables?', 'Each object has its own copy', 'Shared across all instances', 'Must be global', 'Cannot be changed', 2, 1, NULL),
('How do you check if an object is an instance of a class?', 'isinstance(obj, Class)', 'obj in Class', 'type(obj) == Class', 'obj.is(Class)', 2, 1, NULL),
('Which function is used to destroy an object?', '__del__', '__destroy__', 'kill()', '__remove__', 2, 1, NULL),
('How do you inherit from a parent class?', 'class Child(Parent):', 'class Child < Parent:', 'inherits Child(Parent):', 'Child extends Parent', 2, 1, NULL),
('How do you call a parent class method?', 'super().method()', 'this.method()', 'parent.method()', 'self.parent().method()', 2, 1, NULL),
('What does hasattr(obj, "x") do?', 'Checks if obj has attribute x', 'Deletes attribute x', 'Renames x', 'Adds x to obj', 2, 1, NULL),
('Which keyword is used to define class methods?', '@classmethod', '@staticmethod', '@object', '@initmethod', 2, 1, NULL),
('Which of these is shared across all instances?', 'Class variable', 'Instance variable', 'Local variable', 'Function argument', 2, 1, NULL),
('How do you access a class variable?', 'Class.var or self.var', 'Only with self', 'Only with global', 'Direct access is not possible', 2, 1, NULL),
('What is the return type of __str__?', 'str', 'int', 'object', 'None', 2, 1, NULL),

-- Difficulty 3
('What does isinstance(obj, Parent) return for a subclass?', 'True', 'False', 'None', 'Raises an error', 3, 1, NULL),
('How can you override a method from a base class?', 'Define it again in child class', 'Use @override', 'Rename it', 'You can’t', 3, 1, NULL),
('What does dir(obj) return?', 'List of attributes and methods', 'Object ID', 'Class type', 'Memory address', 3, 1, NULL),
('What happens if you forget "self" in a method?', 'Error on calling the method', 'No effect', 'Creates a static method', 'self becomes global', 3, 1, NULL),
('What is the purpose of __repr__?', 'Unambiguous string for debugging', 'Returns class name', 'Creates a new object', 'Formats numbers', 3, 1, NULL),
('Which statement is true about __init__?', 'Called automatically when object is created', 'Used to delete object', 'Must return a value', 'Static method', 3, 1, NULL),
('What is a dunder method?', 'Double underscore method like __init__', 'Global function', 'Class decorator', 'Python keyword', 3, 1, NULL),
('Can you have multiple constructors in Python?', 'No, use default values or classmethods', 'Yes, using def overload()', 'Only with decorators', 'Yes, if all are named __init__', 3, 1, NULL),
('What is polymorphism?', 'Same method name, different behavior', 'Copying an object', 'Multiple return types', 'Type enforcement', 3, 1, NULL),
('What happens if __str__ is not defined?', 'Fallback to __repr__ or default object output', 'Program crashes', 'Returns None', 'Prints only class name', 3, 1, NULL),
('How do you define a private variable?', 'Prefix it with __ (double underscore)', 'Use @private', 'Prefix it with _', 'Declare it outside class', 3, 1, NULL),
('What does object.__class__ return?', 'The class of the object', 'The object type as string', 'A list of methods', 'Nothing', 3, 1, NULL),

-- Difficulty 5
('What is method resolution order (MRO)?', 'Order in which base classes are searched for a method', 'Order of decorators', 'Execution priority', 'Memory allocation rule', 5, 1, NULL),
('What does super() do?', 'Access methods from parent class', 'Run base constructor', 'Switch inheritance', 'Raise exception', 5, 1, NULL),
('How do you define a static method?', '@staticmethod', '@static', 'static()', 'method()', 5, 1, NULL),
('What is a metaclass?', 'Class that creates classes', 'Super class', 'Global function', 'Wrapper around class', 5, 1, NULL),
('What is true about __slots__?', 'Restricts attributes and saves memory', 'Makes object faster', 'Only for abstract classes', 'Used to create threads', 5, 1, NULL),
('What does __new__ do?', 'Creates a new instance before __init__', 'Destroys the object', 'Initializes attributes', 'Skips constructor', 5, 1, NULL),
('What is an abstract base class?', 'Defines interface without implementation', 'Cannot be subclassed', 'No attributes', 'Only used for types', 5, 1, NULL),
('How do you define an abstract method?', '@abstractmethod above the method', 'Use def abstract', 'Leave method empty', '@classmethod', 5, 1, NULL),
('What happens if a subclass does not implement all abstract methods?', 'TypeError on instantiation', 'Nothing', 'Abstract methods are skipped', 'It works normally', 5, 1, NULL),
('Can Python classes support multiple inheritance?', 'Yes', 'No', 'Only in Python 2', 'Only with decorators', 5, 1, NULL),
('What does issubclass(A, B) check?', 'If A is derived from B', 'If B is child of A', 'If A is an object', 'If both are the same', 5, 1, NULL),
('What is the output of class A: pass; print(type(A))?', '<class ''type''>', '<type ''A''>', '<class ''A''>', '<A>', 5, 1, NULL),
('Why use @property?', 'Make a method accessible like an attribute', 'Make a method private', 'Avoid method definition', 'Create static variable', 5, 1, NULL),
('What is a mixin?', 'A class providing optional behavior to other classes', 'Main base class', 'Compiled extension', 'Private helper', 5, 1, NULL);


INSERT INTO q_functions (question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, topic_1, topic_2) VALUES
-- Difficulty 1
('Which keyword is used to define a function in Python?', 'def', 'func', 'function', 'define', 1, 1, NULL),
('How do you call a function named greet?', 'greet()', 'call greet()', 'greet[]', 'run(greet)', 1, 1, NULL),
('What is the default return value of a function if none is specified?', 'None', '0', 'Empty string', 'False', 1, 1, NULL),
('Where do you define parameters in a function?', 'Inside parentheses after def', 'Before def', 'After return', 'Outside the function', 1, 1, NULL),
('What does return do in a function?', 'Sends a value back to the caller', 'Ends the program', 'Skips the loop', 'Restarts the function', 1, 1, NULL),
('Which of these is a valid function name?', 'my_function', '2function', 'my-function', 'function()', 1, 1, NULL),
('How many values can a function return?', 'Any number', 'Only one', 'Two maximum', 'None', 1, 1, NULL),
('Can a function call another function?', 'Yes', 'No', 'Only inside loops', 'Only with import', 1, 1, NULL),
('Which keyword is used to exit a function early?', 'return', 'stop', 'exit', 'break', 1, 1, NULL),
('How do you pass multiple arguments to a function?', 'Separate them with commas', 'Use semicolons', 'Add + between them', 'Use []', 1, 1, NULL),
('Is it required to return a value from a function?', 'No', 'Yes', 'Only in Python 3+', 'Only with arguments', 1, 1, NULL),
('What is the output of len("abc")?', '3', '2', '1', '4', 1, 1, NULL),

-- Difficulty 2
('What is a parameter?', 'A variable in a function definition', 'The result of a function', 'The name of a function', 'A loop inside a function', 2, 1, NULL),
('What is an argument?', 'A value passed to a function', 'The name of a variable', 'A function type', 'A class method', 2, 1, NULL),
('How do you define a function with a default parameter?', 'def greet(name="Tom")', 'def greet(name: "Tom")', 'function greet(name = default)', 'greet(name => Tom)', 2, 1, NULL),
('What is a docstring?', 'A string that describes the function', 'A string variable', 'A loop inside the function', 'A type of comment', 2, 1, NULL),
('What does the *args syntax do?', 'Collects extra positional arguments', 'Defines an array', 'Creates a list', 'Returns all values', 2, 1, NULL),
('What does the **kwargs syntax do?', 'Collects extra keyword arguments', 'Defines a dictionary', 'Returns multiple results', 'Creates class methods', 2, 1, NULL),
('What does len() do?', 'Returns length of an object', 'Adds two numbers', 'Deletes data', 'Generates a random number', 2, 1, NULL),
('What is a lambda function?', 'An anonymous, one-line function', 'A recursive function', 'A built-in function', 'A function with no arguments', 2, 1, NULL),
('How do you write a lambda that adds two numbers?', 'lambda x, y: x + y', 'lambda(x, y) => x + y', 'def lambda(x, y): return x + y', 'x => y => x + y', 2, 1, NULL),
('What is the scope of a function variable?', 'Local to the function', 'Global', 'Only visible in loops', 'Shared between modules', 2, 1, NULL),
('What is recursion?', 'Function calling itself', 'Returning a list', 'Passing default values', 'Using *args', 2, 1, NULL),
('What does map() do?', 'Applies a function to each item in an iterable', 'Maps values to keys', 'Replaces items in a list', 'Prints a map', 2, 1, NULL),

-- Difficulty 3
('Can functions be assigned to variables?', 'Yes, functions are first-class objects', 'No, only strings can be', 'Only if decorated', 'Only in classes', 3, 1, NULL),
('What is a higher-order function?', 'Function that takes or returns another function', 'Function with many parameters', 'Only works in classes', 'Function with *args', 3, 1, NULL),
('What does filter() do?', 'Filters elements using a function', 'Sorts elements', 'Creates a generator', 'Maps values to keys', 3, 1, NULL),
('How do you make a function return multiple values?', 'Use a tuple', 'Return a list', 'Use multiple return statements', 'Add return after each variable', 3, 1, NULL),
('What happens if a return is not used?', 'Function returns None', 'Function crashes', 'Last variable is returned', 'Returns empty string', 3, 1, NULL),
('What does zip() do?', 'Combines iterables into tuples', 'Compresses strings', 'Concatenates lists', 'Filters elements', 3, 1, NULL),
('Can a function be nested inside another?', 'Yes', 'No', 'Only in Python 3+', 'Only with lambda', 3, 1, NULL),
('What is a decorator?', 'A function that modifies another function', 'A type of comment', 'A class method', 'A docstring alias', 3, 1, NULL),
('What does @staticmethod do?', 'Defines a method that does not access self', 'Makes the function faster', 'Turns return into print', 'Enables recursion', 3, 1, NULL),
('What does global keyword do?', 'Accesses a variable from the global scope', 'Creates new variable', 'Locks the variable', 'Makes a list global', 3, 1, NULL),
('What does enumerate() do?', 'Returns index and value', 'Sorts a list', 'Creates a generator', 'Maps function results', 3, 1, NULL),
('What is the result of bool(return)?', 'True, if return value is truthy', 'Always False', 'Depends on variable names', 'None', 3, 1, NULL),

-- Difficulty 5
('What happens if you mutate a default parameter like a list?', 'It persists across function calls', 'It resets every time', 'It raises an error', 'It gets garbage-collected', 5, 1, NULL),
('What is a closure in Python?', 'Function with access to outer variables even after outer function ends', 'A finished loop', 'A terminated function', 'An anonymous function', 5, 1, NULL),
('What is the result of def f(): pass; print(f())?', 'None', '0', 'Error', '()', 5, 1, NULL),
('What is partial() used for?', 'Fixing some arguments of a function', 'Splitting strings', 'Copying function', 'Creating decorators', 5, 1, NULL),
('What is functools.wraps used for?', 'Preserves metadata of wrapped functions', 'Wraps loops in functions', 'Improves performance', 'Hides errors', 5, 1, NULL),
('What is the purpose of nonlocal keyword?', 'Modify a variable in the nearest enclosing scope', 'Define local var', 'Declare global var', 'Create constant', 5, 1, NULL),
('What is the arity of a function?', 'The number of arguments it takes', 'Return type', 'Function name', 'Call depth', 5, 1, NULL),
('What does the yield keyword do?', 'Creates a generator', 'Returns and ends function', 'Raises an exception', 'Calls another function', 5, 1, NULL),
('Can you use return and yield in the same function?', 'No, not in the same code path', 'Yes, always', 'Only in Python 3.8+', 'Only with recursion', 5, 1, NULL),
('What is a generator expression?', '(x for x in iterable)', '[x for x in iterable]', 'def(x): yield x', 'map(x)', 5, 1, NULL),
('What is tail recursion?', 'Recursion where the recursive call is the last operation', 'Recursion with multiple return values', 'List-based recursion', 'Only used in loops', 5, 1, NULL),
('What does inspect.signature(func) do?', 'Returns function parameter signature', 'Measures function speed', 'Lists all decorators', 'Replaces docstring', 5, 1, NULL),
('How can you time a function´s execution?', 'Use time.perf_counter() before/after call', 'Wrap in @timeit', 'Use len()', 'Add sleep(0)', 5, 1, NULL),
('What is the difference between a function and a method?', 'Method is bound to object, function is not', 'Functions are faster', 'Methods return more', 'There is no difference', 5, 1, NULL);

INSERT INTO q_file_handling (question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, topic_1, topic_2) VALUES
-- Difficulty 1
('Which function is used to open a file in Python?', 'open()', 'file()', 'read()', 'get()', 1, 1, NULL),
('Which mode opens a file for reading?', '"r"', '"w"', '"a"', '"rw"', 1, 1, NULL),
('Which method reads the whole content of a file as a string?', 'read()', 'readline()', 'readlines()', 'get()', 1, 1, NULL),
('What does "w" mode do when opening a file?', 'Overwrites the file if it exists', 'Appends to the file', 'Reads only', 'Creates a copy', 1, 1, NULL),
('Which method closes a file?', 'close()', 'end()', 'exit()', 'stop()', 1, 1, NULL),
('Which method reads one line at a time?', 'readline()', 'read()', 'readlines()', 'next()', 1, 1, NULL),
('Which statement is used to safely manage file opening and closing?', 'with', 'open', 'if', 'try', 1, 1, NULL),
('What does "a" mode do?', 'Appends data to the end of the file', 'Reads only', 'Overwrites file', 'Creates a new file only', 1, 1, NULL),
('What does open("file.txt", "x") do?', 'Creates a new file, errors if it exists', 'Reads the file', 'Deletes the file', 'Overwrites if file exists', 1, 1, NULL),
('What type of data does read() return?', 'str', 'list', 'int', 'dict', 1, 1, NULL),
('Which method returns all lines in a file as a list?', 'readlines()', 'read()', 'readline()', 'fetch()', 1, 1, NULL),
('What happens if you open a non-existent file in read mode?', 'It raises a FileNotFoundError', 'It creates the file', 'It returns None', 'It opens an empty file', 1, 1, NULL),

-- Difficulty 2
('How do you write a string to a file?', 'file.write("text")', 'file.read("text")', 'file.open("text")', 'write(file, "text")', 2, 1, NULL),
('How do you open a file for both reading and writing?', '"r+"', '"rw"', '"w+"', '"r/w"', 2, 1, NULL),
('What type does readlines() return?', 'list of strings', 'string', 'dict', 'tuple', 2, 1, NULL),
('How do you check if a file exists before opening it?', 'Use os.path.exists()', 'Use open() and catch error', 'Use file.exist()', 'Use read()', 2, 1, NULL),
('What does file.seek(0) do?', 'Moves cursor to the beginning', 'Skips first line', 'Clears file', 'Deletes first line', 2, 1, NULL),
('Which built-in module helps with file paths?', 'os', 'sys', 'random', 'time', 2, 1, NULL),
('How do you read binary data from a file?', 'Open file in "rb" mode', 'Use file.binary()', 'Use decode()', 'Use bin(file)', 2, 1, NULL),
('What is the effect of file.truncate(0)?', 'Empties the file', 'Deletes the file', 'Reads the first byte', 'Moves cursor to 0', 2, 1, NULL),
('What does os.remove("file.txt") do?', 'Deletes the file', 'Hides the file', 'Empties the file', 'Reads the file', 2, 1, NULL),
('How do you rename a file in Python?', 'os.rename("old", "new")', 'file.rename()', 'file.name = "new"', 'rename(file)', 2, 1, NULL),
('How do you write multiple lines at once?', 'file.writelines(list)', 'file.write_lines(list)', 'file.write(list)', 'write(list)', 2, 1, NULL),
('How do you open a file using UTF-8 encoding?', 'open("file.txt", encoding="utf-8")', 'open("file.txt", "utf-8")', 'file.set_encoding("utf-8")', 'read(utf8)', 2, 1, NULL),

-- Difficulty 3
('What does the "with" statement do when working with files?', 'Automatically closes file', 'Writes to file', 'Deletes file', 'Locks file', 3, 1, NULL),
('How do you list all files in a directory?', 'os.listdir()', 'os.files()', 'dir()', 'get.files()', 3, 1, NULL),
('What does os.path.join() do?', 'Builds path strings in a cross-platform way', 'Joins files', 'Copies a file', 'Removes spaces', 3, 1, NULL),
('Which module is used to copy files?', 'shutil', 'os', 'copy', 'fileutil', 3, 1, NULL),
('What does os.makedirs("dir") do?', 'Creates nested directories', 'Lists subdirectories', 'Deletes folders', 'Renames directories', 3, 1, NULL),
('What does file.flush() do?', 'Forces write buffer to disk', 'Reads file', 'Locks the file', 'Empties the file', 3, 1, NULL),
('What does os.path.isfile(path) check?', 'If the path is a file', 'If the file is open', 'If it is writable', 'If it is binary', 3, 1, NULL),
('How do you handle file read errors safely?', 'Use try-except block', 'Use if-else', 'Call close() first', 'Check length of file', 3, 1, NULL),
('What does os.path.basename(path) return?', 'The file name only', 'The full path', 'The file type', 'The file contents', 3, 1, NULL),
('How do you write JSON data to a file?', 'Use json.dump(data, file)', 'Use file.write_json()', 'Use json.save()', 'file.write(json(data))', 3, 1, NULL),
('How do you read a file line by line using a loop?', 'for line in file', 'while file:', 'read(file)', 'loop(file.lines)', 3, 1, NULL),
('Which function gives current working directory?', 'os.getcwd()', 'os.pwd()', 'os.curdir()', 'file.cwd()', 3, 1, NULL),

-- Difficulty 5
('What happens if you don´t close a file?', 'It may cause memory/resource leaks', 'It deletes the file', 'It prints an error', 'It overwrites data', 5, 1, NULL),
('What does io.StringIO provide?', 'In-memory text stream', 'Stream from stdin', 'Binary reader', 'Thread-safe file object', 5, 1, NULL),
('What does io.BytesIO provide?', 'In-memory binary stream', 'Byte counter', 'Encrypts file', 'Encodes UTF-8', 5, 1, NULL),
('How do you get file size?', 'os.path.getsize("file.txt")', 'file.size()', 'os.file_length()', 'file.len()', 5, 1, NULL),
('How do you make sure writing to file is atomic?', 'Write to temp file then rename', 'Use try-except', 'Lock file', 'Flush twice', 5, 1, NULL),
('What is the advantage of using pathlib?', 'Object-oriented file path operations', 'Faster reads', 'Better encryption', 'Simpler encoding', 5, 1, NULL),
('How do you append binary data?', 'Open file in "ab" mode', 'Use "rb+"', 'Use os.append()', 'file.writeb()', 5, 1, NULL),
('What happens if two scripts open the same file in write mode?', 'Race condition, possible data loss', 'They merge writes', 'File is locked', 'Python blocks second script', 5, 1, NULL),
('What does file.tell() return?', 'Current cursor position in file', 'Total lines in file', 'Byte count', 'File size', 5, 1, NULL),
('How do you create a temp file?', 'tempfile.NamedTemporaryFile()', 'os.mkfile()', 'file.create()', 'shutil.tmp()', 5, 1, NULL),
('What is the difference between "w" and "x" modes?', '"w" overwrites, "x" fails if file exists', '"x" is faster', '"w" writes binary, "x" writes text', 'They’re aliases', 5, 1, NULL),
('What does open(file, "r+", encoding="utf-8") mean?', 'Read and write with UTF-8 encoding', 'Append in UTF-8', 'Read only', 'Write binary', 5, 1, NULL),
('What happens if you write a string to a file opened in binary mode?', 'TypeError is raised', 'It gets converted', 'It is encoded automatically', 'It is ignored', 5, 1, NULL),
('What does os.fsync(f.fileno()) do?', 'Forces file content to be written to disk', 'Closes the file', 'Flushes the buffer', 'Copies file to memory', 5, 1, NULL);

INSERT INTO q_file_handling (question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, topic_1, topic_2) VALUES
-- Difficulty 1
('Which mode do you use to only read from a file?', '"r"', '"w"', '"a"', '"x"', 1, 1, NULL),
('Which method returns an empty string when the end of a file is reached?', 'read()', 'readline()', 'readlines()', 'readall()', 1, 1, NULL),
('What does f = open("data.txt", "a") do?', 'Opens the file for appending', 'Opens file for reading', 'Overwrites the file', 'Deletes the file', 1, 1, NULL),
('Which module provides access to file system functions?', 'os', 'sys', 'io', 'fs', 1, 1, NULL),
('How do you add a newline to written content?', 'Include "\\n" in the string', 'Use file.newline()', 'Call newline()', 'Write a blank string', 1, 1, NULL),
('Which function closes an open file?', 'close()', 'exit()', 'stop()', 'end()', 1, 1, NULL),
('Which method returns the file content line by line in a list?', 'readlines()', 'read()', 'readline()', 'lines()', 1, 1, NULL),
('What does open("file.txt", "w") do if the file exists?', 'Truncates the file', 'Appends to the file', 'Reads it', 'Raises an error', 1, 1, NULL),
('What file mode should you use to prevent overwriting an existing file?', '"x"', '"w"', '"r"', '"a"', 1, 1, NULL),
('Which function lets you check if a file exists?', 'os.path.isfile()', 'open()', 'file.exists()', 'check()', 1, 1, NULL),

-- Difficulty 2
('How do you write a list of strings to a file?', 'writelines()', 'write()', 'append()', 'putlines()', 2, 1, NULL),
('What is returned by file.read() when the file is empty?', 'An empty string', 'None', '0', 'False', 2, 1, NULL),
('How can you move the cursor to the beginning of a file?', 'seek(0)', 'rewind()', 'cursor(0)', 'start()', 2, 1, NULL),
('Which mode would allow you to create a file only if it does not exist?', '"x"', '"w+"', '"a+"', '"r+"', 2, 1, NULL),
('What does file.tell() return?', 'Current cursor position', 'File size', 'Line number', 'File encoding', 2, 1, NULL),
('How can you open a file for appending and reading?', '"a+"', '"w+"', '"r+"', '"x+"', 2, 1, NULL),
('What is a safe way to handle file errors?', 'Use try/except block', 'Use assert', 'Use print()', 'Ignore errors', 2, 1, NULL),
('How do you handle file encoding manually?', 'Pass encoding to open()', 'Use decode()', 'Use codec()', 'Files are always UTF-8', 2, 1, NULL),
('What happens if you call write() on a file opened in "r" mode?', 'Raises an error', 'Writes silently', 'Truncates the file', 'Creates a new file', 2, 1, NULL),
('What does the "with" statement guarantee?', 'Automatic file closure', 'Faster access', 'Thread safety', 'Read-only access', 2, 1, NULL),

-- Difficulty 3
('What does the following do: f.seek(0, 2)?', 'Moves cursor to end of file', 'Moves to start', 'Skips 2 bytes', 'Moves to 2nd line', 3, 1, NULL),
('What will read(5) return?', 'Next 5 characters', 'Next 5 lines', 'Entire file', '5 bytes', 3, 1, NULL),
('What happens if you use "a" mode on a non-existent file?', 'It is created', 'An error is raised', 'It is read', 'Nothing happens', 3, 1, NULL),
('How can you read and write a file without overwriting it?', '"r+"', '"w"', '"x"', '"a"', 3, 1, NULL),
('Which method reads until a newline or EOF?', 'readline()', 'read()', 'readlines()', 'fetch()', 3, 1, NULL),
('What does os.remove("file.txt") do?', 'Deletes the file', 'Moves the file', 'Closes the file', 'Backs up the file', 3, 1, NULL),
('What is a use case for using binary file mode?', 'Reading images', 'Reading JSON', 'Writing text', 'Opening .py files', 3, 1, NULL),
('What does file.mode return?', 'The mode the file was opened with', 'The file type', 'The encoding', 'File path', 3, 1, NULL),
('Can you open two files at once in a with block?', 'Yes, using commas', 'No', 'Only in loops', 'Only with os.open', 3, 1, NULL),
('What is the result of reading a file twice without seek()?', 'Second read is empty', 'Duplicates the content', 'Error is raised', 'New cursor starts', 3, 1, NULL),

-- Difficulty 5
('What is the benefit of buffering in file I/O?', 'Improves performance by reducing disk access', 'Prevents data loss', 'Faster loading', 'Less RAM usage', 5, 1, NULL),
('Which function creates a temporary file?', 'tempfile.TemporaryFile()', 'open_temp()', 'os.tmp()', 'file.create_temp()', 5, 1, NULL),
('How do you open a file for both binary writing and reading?', '"wb+"', '"bw+"', '"br+"', '"wrb"', 5, 1, NULL),
('Which encoding handles most Unicode characters?', 'utf-8', 'ascii', 'latin1', 'binary', 5, 1, NULL),
('How can you append bytes to a binary file?', 'Use "ab" mode', 'Use "rb+"', 'Use "wb"', 'Use "xb+"', 5, 1, NULL),
('What does file.flush() do?', 'Pushes data from buffer to disk', 'Closes the file', 'Deletes buffer', 'Resets file', 5, 1, NULL),
('What happens when opening a directory with open()?', 'Raises IsADirectoryError', 'Reads metadata', 'Returns list of files', 'Creates new file', 5, 1, NULL),
('How can you copy file permissions from one file to another?', 'shutil.copymode()', 'os.copyperm()', 'fs.setperm()', 'copy2()', 5, 1, NULL),
('What does os.rename("a.txt", "b.txt") do?', 'Renames or moves the file', 'Copies it', 'Deletes it', 'Backs it up', 5, 1, NULL),
('What happens if you open a file with "r+b"?', 'Allows reading and writing in binary mode', 'Only reads binary', 'Truncates the file', 'Creates a new file', 5, 1, NULL);

INSERT INTO q_classes (question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, topic_1, topic_2) VALUES
-- Difficulty 1
('What does a class in Python represent?', 'A blueprint for creating objects', 'A function', 'A variable', 'A data structure', 1, 1, NULL),
('What keyword is used to define a class in Python?', 'class', 'def', 'object', 'function', 1, 1, NULL),
('How do you create an instance of a class?', 'Call the class like a function', 'Use the new keyword', 'Define a variable', 'Call a method', 1, 1, NULL),
('What is the purpose of the __init__() method in a class?', 'To initialize the object´s attributes', 'To define the class', 'To call methods', 'To return an object', 1, 1, NULL),
('What is the self keyword used for?', 'To refer to the instance of the class', 'To define variables', 'To access a method', 'To create a new object', 1, 1, NULL),
('What type of method is defined to operate on class-level attributes?', 'Class method', 'Instance method', 'Static method', 'Abstract method', 1, 1, NULL),
('How do you access an object´s attribute in Python?', 'Using dot notation', 'Using square brackets', 'Using parentheses', 'Using a comma', 1, 1, NULL),
('Which method is called automatically when a new object is created?', '__init__()', '__new__()', '__del__()', '__call__()', 1, 1, NULL),
('How do you call a method of an object?', 'Object.method()', 'Object.method', 'method()', 'method.object()', 1, 1, NULL),
('Can a class inherit from another class in Python?', 'Yes, using parentheses', 'No', 'Only from built-in classes', 'Only from one class', 1, 1, NULL),

-- Difficulty 2
('What is inheritance in Python classes?', 'A way to share functionality between classes', 'A method to create objects', 'A way to store data', 'A way to access variables', 2, 1, NULL),
('What does the super() function do?', 'Calls a method from the parent class', 'Creates a new object', 'Returns the class object', 'Gets the method of the current class', 2, 1, NULL),
('Which of these is used for method overriding in subclasses?', 'Defining a method with the same name in a subclass', 'Calling the parent method', 'Adding a static method', 'Changing the variable type', 2, 1, NULL),
('What keyword is used to make a class attribute constant (immutable)?', 'final', 'const', 'static', 'class', 2, 1, NULL),
('How can a method access a class variable?', 'Using the class name', 'Directly through self', 'Using self.variable', 'Using super()', 2, 1, NULL),
('Can Python classes have multiple constructors?', 'No, but you can use default parameters', 'Yes, by using the @staticmethod decorator', 'Yes, by using multiple __init__ methods', 'No, there is only one constructor', 2, 1, NULL),
('How do you define a static method in a Python class?', 'Using @staticmethod', 'Using @classmethod', 'Using @property', 'Without any decorator', 2, 1, NULL),
('What is the difference between an instance method and a class method?', 'Class methods are bound to the class, instance methods to the object', 'Class methods require self, instance methods do not', 'Class methods are defined outside the class', 'There is no difference', 2, 1, NULL),
('What does the __str__() method do?', 'Returns a string representation of the object', 'Creates a new string attribute', 'Returns the object name', 'Sets the object´s string value', 2, 1, NULL),
('Can you define a class without any methods?', 'Yes, it is called a basic class', 'No, every class must have methods', 'No, it needs an __init__() method', 'No, it needs a __str__() method', 2, 1, NULL),

-- Difficulty 3
('What does the @property decorator do in a class?', 'Turns a method into a getter for a property', 'Turns a method into a setter', 'Defines a class-level attribute', 'Creates an instance method', 3, 1, NULL),
('How do you create a class method?', 'By using the @classmethod decorator', 'By using self', 'By using the @staticmethod decorator', 'By using def method_name()', 3, 1, NULL),
('What is the purpose of the __del__() method in a class?', 'To clean up when an object is deleted', 'To return the object', 'To initialize the object', 'To call parent methods', 3, 1, NULL),
('What is the output of calling dir() on a class?', 'List of class attributes and methods', 'The class name', 'The methods of the class', 'The instance variables', 3, 1, NULL),
('What is an abstract class in Python?', 'A class that cannot be instantiated directly', 'A class with no methods', 'A class with only static methods', 'A class with no attributes', 3, 1, NULL),
('What module allows you to define abstract classes in Python?', 'abc', 'os', 'sys', 're', 3, 1, NULL),
('What does the isinstance() function do?', 'Checks if an object is an instance of a class', 'Checks if a class is defined', 'Returns the class name of an object', 'Creates an instance of a class', 3, 1, NULL),
('What does the @abstractmethod decorator do?', 'Marks a method as required to be implemented by subclasses', 'Makes a method static', 'Defines a class method', 'Defines a property method', 3, 1, NULL),
('How do you define a class variable that is shared across all instances?', 'By defining it outside the __init__ method', 'By defining it in __init__()', 'By using self', 'By making it a global variable', 3, 1, NULL),
('What is the output of class inheritance without overriding methods?', 'The subclass uses methods from the parent class', 'An error is raised', 'It creates an empty method', 'The subclass cannot use any methods', 3, 1, NULL),

-- Difficulty 5
('What is a metaclass in Python?', 'A class that defines how other classes are created', 'A class that defines instance methods', 'A special class that only has static methods', 'A class that can instantiate other classes', 5, 1, NULL),
('How do you create a class that dynamically creates methods?', 'By using metaclasses', 'By using class methods', 'By using __init__()', 'By using static methods', 5, 1, NULL),
('What does the __mro__ attribute represent in Python?', 'Method Resolution Order', 'Memory Address Order', 'Meta-class Resolution Order', 'Module Resolution Order', 5, 1, NULL),
('How can you ensure that a method is called only once when a class is used?', 'By using a singleton pattern', 'By using a static method', 'By using a class method', 'By using a class variable', 5, 1, NULL),
('How do you modify the behavior of class instantiation?', 'By overriding the __new__() method', 'By overriding __init__()', 'By using super()', 'By adding an extra constructor', 5, 1, NULL),
('What happens if you add a class as an argument in a function?', 'It is treated as a type of argument', 'It is ignored', 'The function can create instances of that class', 'It raises an error', 5, 1, NULL),
('What is the purpose of the __call__() method in a class?', 'Allows an instance to be called as a function', 'Defines the constructor', 'Overrides object comparison', 'Sets default values for attributes', 5, 1, NULL),
('How do you create a class with multiple inheritance?', 'By listing parent classes in parentheses', 'By using @staticmethod', 'By using a metaclass', 'By calling the parent classes manually', 5, 1, NULL),
('What does the super() function do in multiple inheritance?', 'It calls the next class in the Method Resolution Order', 'It calls the first parent class', 'It ignores the parent classes', 'It calls a static method from the parent class', 5, 1, NULL),
('How would you create an object of a class defined inside another class?', 'Use outer_class.inner_class()', 'Use inner_class()', 'Call outer_class.method()', 'Define the inner class outside', 5, 1, NULL);

INSERT INTO q_functions (question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, topic_1, topic_2) VALUES
-- Difficulty 1
('How do you define a function in Python?', 'By using the def keyword', 'By using the function keyword', 'By using the define keyword', 'By using func()', 1, 2, NULL),
('What is the correct way to call a function in Python?', 'function_name()', 'call function_name()', 'function()', 'call function()', 1, 2, NULL),
('What does the return statement do in a function?', 'Ends the function and returns a value', 'Defines a function', 'Calls another function', 'Prints a value', 1, 2, NULL),
('Which of the following is used to pass arguments to a function?', 'Function parameters', 'Function return values', 'Global variables', 'Global constants', 1, 2, NULL),
('What is the purpose of the `def` keyword?', 'To define a function', 'To call a function', 'To declare a variable', 'To import a module', 1, 2, NULL),
('How do you pass multiple arguments to a function?', 'Separate them with commas', 'Use parentheses only', 'Use the plus sign', 'Use curly brackets', 1, 2, NULL),
('What happens if a function does not have a return statement?', 'It returns None by default', 'It raises an error', 'It prints an empty string', 'It stops executing', 1, 2, NULL),
('How do you define default parameters in a function?', 'By assigning a value in the function signature', 'By using the @staticmethod decorator', 'By using the *args syntax', 'By using global variables', 1, 2, NULL),
('Can a function in Python return multiple values?', 'Yes, by returning a tuple', 'No, it can only return one value', 'Yes, but only if using a list', 'Yes, but only if using a dictionary', 1, 2, NULL),
('What is the output of a function if no return statement is specified?', 'None', 'Empty string', 'False', 'Zero', 1, 2, NULL),

-- Difficulty 2
('How do you specify an argument with a default value in Python?', 'By using assignment in the function definition', 'By using the default keyword', 'By using the argument keyword', 'By using an equal sign in the function call', 2, 2, NULL),
('What is the purpose of *args in a function?', 'To pass a variable number of positional arguments', 'To pass a keyword argument', 'To define default parameters', 'To define class methods', 2, 2, NULL),
('What is the purpose of **kwargs in a function?', 'To pass a variable number of keyword arguments', 'To define a function with no arguments', 'To pass only one argument', 'To set default values', 2, 2, NULL),
('What is the output of a function that has the statement `return` without any value?', 'None', 'True', 'False', 'Empty string', 2, 2, NULL),
('How can you call a function inside itself?', 'By using recursion', 'By using a loop', 'By using the call function', 'By defining the function again', 2, 2, NULL),
('What is a lambda function in Python?', 'A small anonymous function defined with the lambda keyword', 'A function that cannot return values', 'A function that only accepts one argument', 'A function that raises exceptions', 2, 2, NULL),
('What does the `map()` function do in Python?', 'Applies a function to all items in an iterable', 'Returns a new function', 'Maps input arguments to output variables', 'Maps keywords to arguments', 2, 2, NULL),
('What does the `filter()` function do in Python?', 'Filters an iterable based on a function that returns a boolean', 'Returns a filtered version of a function', 'Defines a function based on a condition', 'Filters all variables', 2, 2, NULL),
('How do you define a function that accepts a variable number of keyword arguments?', 'By using **kwargs', 'By using *args', 'By using def function(**kwargs)', 'By defining the keyword arguments manually', 2, 2, NULL),
('What does the `reduce()` function do in Python?', 'Applies a function cumulatively to the items of an iterable', 'Returns the sum of an iterable', 'Combines multiple functions into one', 'Iterates through the items of an iterable', 2, 2, NULL),

-- Difficulty 3
('What is the difference between *args and **kwargs?', '*args is for positional arguments, **kwargs is for keyword arguments', 'They are the same', '*args is used for default values, **kwargs is for variable arguments', 'There is no difference', 3, 2, NULL),
('How do you define a function that returns multiple values in a single statement?', 'By returning a tuple', 'By returning a list', 'By using a generator', 'By returning a dictionary', 3, 2, NULL),
('How do you create a recursive function in Python?', 'By calling the function inside itself', 'By using a loop inside the function', 'By using a conditional statement inside the function', 'By defining a helper function', 3, 2, NULL),
('How do you handle exceptions in a function?', 'By using try-except blocks', 'By using if-else conditions', 'By using return statements', 'By using global variables', 3, 2, NULL),
('What is the output of `lambda x: x + 2` when passed the argument 5?', '7', '5', '2', 'None', 3, 2, NULL),
('What happens when you call a function with too many arguments in Python?', 'It raises a TypeError', 'It ignores the extra arguments', 'It calls the function without the extra arguments', 'It calls the function with default values', 3, 2, NULL),
('What is the purpose of the `yield` keyword in Python?', 'To return a value and pause the function', 'To define a generator function', 'To define a static method', 'To end a function', 3, 2, NULL),
('What type of value does a generator function return?', 'An iterator', 'A list', 'A string', 'A dictionary', 3, 2, NULL),
('What is the output of the function call `map(str, [1, 2, 3])`?', '["1", "2", "3"]', '[1, 2, 3]', '["1", 2, 3]', '[1, "2", 3]', 3, 2, NULL),
('How do you define a function with a variable number of positional and keyword arguments?', 'By using *args and **kwargs', 'By using default parameters', 'By using a tuple', 'By using a list', 3, 2, NULL),

-- Difficulty 5
('What is the difference between a generator and a regular function in Python?', 'A generator uses yield and returns an iterator', 'A generator returns a list', 'A regular function uses return statements', 'There is no difference', 5, 2, NULL),
('What is the purpose of the `global` keyword in a function?', 'To access global variables inside a function', 'To define local variables', 'To create global functions', 'To modify function parameters', 5, 2, NULL),
('How do you create a closure in Python?', 'By defining a function inside another function', 'By using lambda functions', 'By using recursive functions', 'By using decorators', 5, 2, NULL),
('What is a decorator in Python?', 'A function that modifies another function', 'A function that returns a value', 'A function with default parameters', 'A function that accepts arguments', 5, 2, NULL),
('How does the `@staticmethod` decorator affect a function?', 'It makes the function bound to the class, not the instance', 'It makes the function private', 'It makes the function return a static value', 'It makes the function available to all instances', 5, 2, NULL),
('What does the `@classmethod` decorator do in Python?', 'It makes a method bound to the class, not the instance', 'It makes the method static', 'It defines a class variable', 'It defines an instance method', 5, 2, NULL),
('What is the purpose of `functools.partial()`?', 'To create a function with some arguments fixed', 'To define a recursive function', 'To call a function in a loop', 'To define a class method', 5, 2, NULL),
('What is the purpose of the `__call__()` method in a class?', 'To allow an object to be called as a function', 'To return an instance of the class', 'To initialize a class object', 'To call another method in the class', 5, 2, NULL),
('What does the `help()` function do in Python?', 'Provides information about an object or function', 'Executes a function', 'Imports a module', 'Defines a function', 5, 2, NULL),
('How do you pass a function as an argument in Python?', 'By passing the function name without parentheses', 'By passing the function name with parentheses', 'By using a lambda function', 'By using *args', 5, 2, NULL);

CREATE VIEW "questions_per_diff_and_cat" AS
SELECT 
q_general.difficulty AS "Difficulty",
COUNT(DISTINCT q_general.question) AS "q_general",
COUNT(DISTINCT q_classes.question) AS "q_classes",
COUNT(DISTINCT q_functions.question) AS "q_functions",
COUNT(DISTINCT q_file_handling.question) AS "q_file_handling"
FROM q_general
JOIN q_classes ON q_general.difficulty=q_classes.difficulty 
JOIN q_functions ON q_general.difficulty=q_functions.difficulty
JOIN q_file_handling ON q_general.difficulty=q_file_handling.difficulty 
GROUP BY q_general.difficulty ORDER BY q_general.difficulty;


SELECT 
q_general.difficulty AS "Difficulty",
COUNT(q_general.question) AS "q_general",
COUNT(q_classes.question) AS "q_classes",
COUNT(q_functions.question) AS "q_functions",
COUNT(q_file_handling.question) AS "q_file_handling"
FROM q_general
JOIN q_classes ON q_general.difficulty=q_classes.difficulty 
JOIN q_functions ON q_general.difficulty=q_functions.difficulty
JOIN q_file_handling ON q_general.difficulty=q_file_handling.difficulty 
GROUP BY q_general.difficulty ORDER BY q_general.difficulty;