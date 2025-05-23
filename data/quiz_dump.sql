--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: q_classes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.q_classes (
    id integer NOT NULL,
    question character varying NOT NULL,
    correct_answer character varying NOT NULL,
    wrong_1 character varying NOT NULL,
    wrong_2 character varying NOT NULL,
    wrong_3 character varying NOT NULL,
    difficulty integer NOT NULL,
    added_by character varying(255)
);


--
-- Name: classes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.classes_id_seq OWNED BY public.q_classes.id;


--
-- Name: q_file_handling; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.q_file_handling (
    id integer NOT NULL,
    question character varying NOT NULL,
    correct_answer character varying NOT NULL,
    wrong_1 character varying NOT NULL,
    wrong_2 character varying NOT NULL,
    wrong_3 character varying NOT NULL,
    difficulty integer NOT NULL,
    added_by character varying(255)
);


--
-- Name: file_handling_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.file_handling_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: file_handling_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.file_handling_id_seq OWNED BY public.q_file_handling.id;


--
-- Name: q_functions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.q_functions (
    id integer NOT NULL,
    question character varying NOT NULL,
    correct_answer character varying NOT NULL,
    wrong_1 character varying NOT NULL,
    wrong_2 character varying NOT NULL,
    wrong_3 character varying NOT NULL,
    difficulty integer NOT NULL,
    added_by character varying(255)
);


--
-- Name: functions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.functions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: functions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.functions_id_seq OWNED BY public.q_functions.id;


--
-- Name: q_general; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.q_general (
    id integer NOT NULL,
    question character varying NOT NULL,
    correct_answer character varying(255) NOT NULL,
    wrong_1 character varying(255) NOT NULL,
    wrong_2 character varying(255) NOT NULL,
    wrong_3 character varying(255) NOT NULL,
    difficulty integer NOT NULL,
    added_by character varying(255)
);


--
-- Name: general_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.general_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: general_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.general_id_seq OWNED BY public.q_general.id;


--
-- Name: player; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    password bytea NOT NULL,
    answered_questions json
);


--
-- Name: player_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;


--
-- Name: questions_per_diff_and_cat; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.questions_per_diff_and_cat AS
 SELECT difficulty,
    sum(q_general) AS q_general,
    sum(q_classes) AS q_classes,
    sum(q_functions) AS q_functions,
    sum(q_file_handling) AS q_file_handling
   FROM ( SELECT q_general.difficulty,
            count(*) AS q_general,
            0 AS q_classes,
            0 AS q_functions,
            0 AS q_file_handling
           FROM public.q_general
          GROUP BY q_general.difficulty
        UNION ALL
         SELECT q_classes.difficulty,
            0,
            count(*) AS count,
            0,
            0
           FROM public.q_classes
          GROUP BY q_classes.difficulty
        UNION ALL
         SELECT q_functions.difficulty,
            0,
            0,
            count(*) AS count,
            0
           FROM public.q_functions
          GROUP BY q_functions.difficulty
        UNION ALL
         SELECT q_file_handling.difficulty,
            0,
            0,
            0,
            count(*) AS count
           FROM public.q_file_handling
          GROUP BY q_file_handling.difficulty) combined
  GROUP BY difficulty
  ORDER BY difficulty;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    topic character varying(255) NOT NULL
);


--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: player id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);


--
-- Name: q_classes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.q_classes ALTER COLUMN id SET DEFAULT nextval('public.classes_id_seq'::regclass);


--
-- Name: q_file_handling id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.q_file_handling ALTER COLUMN id SET DEFAULT nextval('public.file_handling_id_seq'::regclass);


--
-- Name: q_functions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.q_functions ALTER COLUMN id SET DEFAULT nextval('public.functions_id_seq'::regclass);


--
-- Name: q_general id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.q_general ALTER COLUMN id SET DEFAULT nextval('public.general_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.player (id, name, password, answered_questions) FROM stdin;
2	Jeff	\\x4a444a694a4445794a454e6d636b46614d6c566f536c4d345532353661455a6c64465a5751693550523231754c305931546d78546554684f53325135553152754f55564261476c344c315930536e6c48	{"q_general": [83, 41, 40, 44, 36], "q_functions": [], "q_classes": [], "q_file_handling": []}
3	Josh	\\x4a444a694a4445794a444646646e4d32626e6c4265444a5553476c6c4c6d4a734f4574685455397955446c44526d56794f57354a526d685554444a4c5647684d54555248593364364d57465855304668	{"q_general": [], "q_functions": [], "q_classes": [52], "q_file_handling": []}
4	Tom	\\x4a444a694a4445794a485656526d6c515a32637a4f545a31644335754c6b567a6131427156325651536a6c46565764774d7a6431613039495332464b64574a744d3342304e3352534d7a64554e545248	\N
5	Thomas	\\x4a444a694a4445794a45747357554a7253554d3256444a6e516b685a536c56325a7a646161433430565774716254497552304a79623068704d6e68744d4856444d3352795354646f56326c7954485670	\N
6	Jean	\\x4a444a694a4445794a484e454c6d565053584e4a4e5739705a444e696348707563574a47515856754e484e484d57394c643345336444413264336c30543263335a45787459546c5163306874516a4258	\N
7	Jose	\\x4a444a694a4445794a4442775a584a5a6547786f64316c6c52475676547a6b764f4577354d453943576b3534516d4a5651335a77646d387852566852656d643464444e7a4f5659315231463459326c78	\N
8	Cassandra	\\x4a444a694a4445794a4774454e6d6c794d6b46714d6e565065554a45644746584c6e5930566e5652645668345631705861476b764d6c517a4d584933656d7457516b784a5a58564c57446b7654455635	\N
10	Tarzan	\\x4a444a694a4445794a466c4654466c75646e46304e57464359564e43636b6c4a5a6b5a56516d566e575664445547785959306c5757486854626e56544e564e456130746f656b74694d474630566a5644	\N
11	Jumbo	\\x4a444a694a4445794a4849755931566e4c6e4d325245354c4c79353565477075626c68755a6b396f526a683665566b78623278734c6d35324f485671643352784d3168686155315453446845627a4a31	\N
12	Steve	\\x4a444a694a4445794a484e4757546455536b527a5a3252555a6b77345132567257454a48563256535331647859693532626b4a6d5448564463485a6a52474a784e6d6c4e52476c49516e523053327874	{"q_general": [], "q_functions": [19, 16, 17, 23], "q_classes": [], "q_file_handling": []}
1	Philip	\\x4a444a694a4445794a486476565339695157563664575a495a44686e4e544247634864426569353256793569567a64535a6d70735a484e6a52475a346144464b5355684a5158704d5a336f7653334a68	{"q_general": [48, 94, 96, 93, 32, 1, 67, 71, 3, 29, 5], "q_functions": [32, 25, 30, 28], "q_classes": [16, 70, 62, 67, 17, 13], "q_file_handling": []}
\.


--
-- Data for Name: q_classes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.q_classes (id, question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, added_by) FROM stdin;
3	How do you create a new object from a class named Dog?	my_dog = Dog()	Dog = my_dog()	create Dog()	Dog.my_dog()	1	Admin
4	Which keyword refers to the current object inside a class?	self	this	me	current	1	Admin
5	What symbol is used to access attributes or methods?	.	->	:	@	1	Admin
6	Which method is called when an object is created?	__init__	__new__	__create__	start()	1	Admin
7	How do you define a class named Car?	class Car:	Car class:	def Car:	new class Car:	1	Admin
8	Which of these is a class attribute?	Defined outside __init__	Defined inside __init__	Passed to __init__ only	Stored in a list	1	Admin
9	What does object-oriented programming use?	Classes and objects	Functions only	Lists and tuples	Just logic	1	Admin
10	Which of the following creates an instance variable?	self.name = "Tom"	name = "Tom"	__name = "Tom"	this.name = "Tom"	1	Admin
11	What is the result of type(my_obj) if my_obj is an instance of MyClass?	<class 'MyClass'>	<type 'object'>	<obj 'MyClass'>	MyClass()	1	Admin
12	Can you define a class with no members?	Yes, using pass	No	Only in Python 3+	Only with return	1	Admin
13	How can you access an attribute "name" of an object "person"?	person.name	person->name	person:name	name.person	2	Admin
14	What does __str__ return?	A string representation of the object	Object type	Object address	A class name	2	Admin
15	What is true about instance variables?	Each object has its own copy	Shared across all instances	Must be global	Cannot be changed	2	Admin
16	How do you check if an object is an instance of a class?	isinstance(obj, Class)	obj in Class	type(obj) == Class	obj.is(Class)	2	Admin
17	Which function is used to destroy an object?	__del__	__destroy__	kill()	__remove__	2	Admin
18	How do you inherit from a parent class?	class Child(Parent):	class Child < Parent:	inherits Child(Parent):	Child extends Parent	2	Admin
19	How do you call a parent class method?	super().method()	this.method()	parent.method()	self.parent().method()	2	Admin
20	What does hasattr(obj, "x") do?	Checks if obj has attribute x	Deletes attribute x	Renames x	Adds x to obj	2	Admin
21	Which keyword is used to define class methods?	@classmethod	@staticmethod	@object	@initmethod	2	Admin
22	Which of these is shared across all instances?	Class variable	Instance variable	Local variable	Function argument	2	Admin
23	How do you access a class variable?	Class.var or self.var	Only with self	Only with global	Direct access is not possible	2	Admin
24	What is the return type of __str__?	str	int	object	None	2	Admin
25	What does isinstance(obj, Parent) return for a subclass?	True	False	None	Raises an error	3	Admin
26	How can you override a method from a base class?	Define it again in child class	Use @override	Rename it	You can’t	3	Admin
27	What does dir(obj) return?	List of attributes and methods	Object ID	Class type	Memory address	3	Admin
28	What happens if you forget "self" in a method?	Error on calling the method	No effect	Creates a static method	self becomes global	3	Admin
29	What is the purpose of __repr__?	Unambiguous string for debugging	Returns class name	Creates a new object	Formats numbers	3	Admin
30	Which statement is true about __init__?	Called automatically when object is created	Used to delete object	Must return a value	Static method	3	Admin
31	What is a dunder method?	Double underscore method like __init__	Global function	Class decorator	Python keyword	3	Admin
32	Can you have multiple constructors in Python?	No, use default values or classmethods	Yes, using def overload()	Only with decorators	Yes, if all are named __init__	3	Admin
33	What is polymorphism?	Same method name, different behavior	Copying an object	Multiple return types	Type enforcement	3	Admin
34	What happens if __str__ is not defined?	Fallback to __repr__ or default object output	Program crashes	Returns None	Prints only class name	3	Admin
35	How do you define a private variable?	Prefix it with __ (double underscore)	Use @private	Prefix it with _	Declare it outside class	3	Admin
36	What does object.__class__ return?	The class of the object	The object type as string	A list of methods	Nothing	3	Admin
37	What is method resolution order (MRO)?	Order in which base classes are searched for a method	Order of decorators	Execution priority	Memory allocation rule	5	Admin
38	What does super() do?	Access methods from parent class	Run base constructor	Switch inheritance	Raise exception	5	Admin
39	How do you define a static method?	@staticmethod	@static	static()	method()	5	Admin
40	What is a metaclass?	Class that creates classes	Super class	Global function	Wrapper around class	5	Admin
41	What is true about __slots__?	Restricts attributes and saves memory	Makes object faster	Only for abstract classes	Used to create threads	5	Admin
42	What does __new__ do?	Creates a new instance before __init__	Destroys the object	Initializes attributes	Skips constructor	5	Admin
43	What is an abstract base class?	Defines interface without implementation	Cannot be subclassed	No attributes	Only used for types	5	Admin
44	How do you define an abstract method?	@abstractmethod above the method	Use def abstract	Leave method empty	@classmethod	5	Admin
45	What happens if a subclass does not implement all abstract methods?	TypeError on instantiation	Nothing	Abstract methods are skipped	It works normally	5	Admin
46	Can Python classes support multiple inheritance?	Yes	No	Only in Python 2	Only with decorators	5	Admin
47	What does issubclass(A, B) check?	If A is derived from B	If B is child of A	If A is an object	If both are the same	5	Admin
48	What is the output of class A: pass; print(type(A))?	<class 'type'>	<type 'A'>	<class 'A'>	<A>	5	Admin
49	Why use @property?	Make a method accessible like an attribute	Make a method private	Avoid method definition	Create static variable	5	Admin
50	What is a mixin?	A class providing optional behavior to other classes	Main base class	Compiled extension	Private helper	5	Admin
51	What does a class in Python represent?	A blueprint for creating objects	A function	A variable	A data structure	1	Admin
52	What keyword is used to define a class in Python?	class	def	object	function	1	Admin
53	How do you create an instance of a class?	Call the class like a function	Use the new keyword	Define a variable	Call a method	1	Admin
54	What is the purpose of the __init__() method in a class?	To initialize the object´s attributes	To define the class	To call methods	To return an object	1	Admin
55	What is the self keyword used for?	To refer to the instance of the class	To define variables	To access a method	To create a new object	1	Admin
56	What type of method is defined to operate on class-level attributes?	Class method	Instance method	Static method	Abstract method	1	Admin
57	How do you access an object´s attribute in Python?	Using dot notation	Using square brackets	Using parentheses	Using a comma	1	Admin
58	Which method is called automatically when a new object is created?	__init__()	__new__()	__del__()	__call__()	1	Admin
59	How do you call a method of an object?	Object.method()	Object.method	method()	method.object()	1	Admin
60	Can a class inherit from another class in Python?	Yes, using parentheses	No	Only from built-in classes	Only from one class	1	Admin
61	What is inheritance in Python classes?	A way to share functionality between classes	A method to create objects	A way to store data	A way to access variables	2	Admin
62	What does the super() function do?	Calls a method from the parent class	Creates a new object	Returns the class object	Gets the method of the current class	2	Admin
63	Which of these is used for method overriding in subclasses?	Defining a method with the same name in a subclass	Calling the parent method	Adding a static method	Changing the variable type	2	Admin
64	What keyword is used to make a class attribute constant (immutable)?	final	const	static	class	2	Admin
65	How can a method access a class variable?	Using the class name	Directly through self	Using self.variable	Using super()	2	Admin
66	Can Python classes have multiple constructors?	No, but you can use default parameters	Yes, by using the @staticmethod decorator	Yes, by using multiple __init__ methods	No, there is only one constructor	2	Admin
67	How do you define a static method in a Python class?	Using @staticmethod	Using @classmethod	Using @property	Without any decorator	2	Admin
68	What is the difference between an instance method and a class method?	Class methods are bound to the class, instance methods to the object	Class methods require self, instance methods do not	Class methods are defined outside the class	There is no difference	2	Admin
69	What does the __str__() method do?	Returns a string representation of the object	Creates a new string attribute	Returns the object name	Sets the object´s string value	2	Admin
70	Can you define a class without any methods?	Yes, it is called a basic class	No, every class must have methods	No, it needs an __init__() method	No, it needs a __str__() method	2	Admin
71	What does the @property decorator do in a class?	Turns a method into a getter for a property	Turns a method into a setter	Defines a class-level attribute	Creates an instance method	3	Admin
72	How do you create a class method?	By using the @classmethod decorator	By using self	By using the @staticmethod decorator	By using def method_name()	3	Admin
73	What is the purpose of the __del__() method in a class?	To clean up when an object is deleted	To return the object	To initialize the object	To call parent methods	3	Admin
74	What is the output of calling dir() on a class?	List of class attributes and methods	The class name	The methods of the class	The instance variables	3	Admin
75	What is an abstract class in Python?	A class that cannot be instantiated directly	A class with no methods	A class with only static methods	A class with no attributes	3	Admin
76	What module allows you to define abstract classes in Python?	abc	os	sys	re	3	Admin
77	What does the isinstance() function do?	Checks if an object is an instance of a class	Checks if a class is defined	Returns the class name of an object	Creates an instance of a class	3	Admin
78	What does the @abstractmethod decorator do?	Marks a method as required to be implemented by subclasses	Makes a method static	Defines a class method	Defines a property method	3	Admin
79	How do you define a class variable that is shared across all instances?	By defining it outside the __init__ method	By defining it in __init__()	By using self	By making it a global variable	3	Admin
80	What is the output of class inheritance without overriding methods?	The subclass uses methods from the parent class	An error is raised	It creates an empty method	The subclass cannot use any methods	3	Admin
81	What is a metaclass in Python?	A class that defines how other classes are created	A class that defines instance methods	A special class that only has static methods	A class that can instantiate other classes	5	Admin
82	How do you create a class that dynamically creates methods?	By using metaclasses	By using class methods	By using __init__()	By using static methods	5	Admin
83	What does the __mro__ attribute represent in Python?	Method Resolution Order	Memory Address Order	Meta-class Resolution Order	Module Resolution Order	5	Admin
84	How can you ensure that a method is called only once when a class is used?	By using a singleton pattern	By using a static method	By using a class method	By using a class variable	5	Admin
85	How do you modify the behavior of class instantiation?	By overriding the __new__() method	By overriding __init__()	By using super()	By adding an extra constructor	5	Admin
86	What happens if you add a class as an argument in a function?	It is treated as a type of argument	It is ignored	The function can create instances of that class	It raises an error	5	Admin
87	What is the purpose of the __call__() method in a class?	Allows an instance to be called as a function	Defines the constructor	Overrides object comparison	Sets default values for attributes	5	Admin
1	What keyword is used to define a class in Python?	class	def	object	function	1	Admin
2	What is the name of the method used to initialize an object?	__init__	__start__	__create__	init()	1	Admin
88	How do you create a class with multiple inheritance?	By listing parent classes in parentheses	By using @staticmethod	By using a metaclass	By calling the parent classes manually	5	Admin
89	What does the super() function do in multiple inheritance?	It calls the next class in the Method Resolution Order	It calls the first parent class	It ignores the parent classes	It calls a static method from the parent class	5	Admin
90	How would you create an object of a class defined inside another class?	Use outer_class.inner_class()	Use inner_class()	Call outer_class.method()	Define the inner class outside	5	Admin
\.


--
-- Data for Name: q_file_handling; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.q_file_handling (id, question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, added_by) FROM stdin;
17	What does file.seek(0) do?	Moves cursor to the beginning	Skips first line	Clears file	Deletes first line	2	Admin
18	Which built-in module helps with file paths?	os	sys	random	time	2	Admin
19	How do you read binary data from a file?	Open file in "rb" mode	Use file.binary()	Use decode()	Use bin(file)	2	Admin
20	What is the effect of file.truncate(0)?	Empties the file	Deletes the file	Reads the first byte	Moves cursor to 0	2	Admin
21	What does os.remove("file.txt") do?	Deletes the file	Hides the file	Empties the file	Reads the file	2	Admin
22	How do you rename a file in Python?	os.rename("old", "new")	file.rename()	file.name = "new"	rename(file)	2	Admin
23	How do you write multiple lines at once?	file.writelines(list)	file.write_lines(list)	file.write(list)	write(list)	2	Admin
24	How do you open a file using UTF-8 encoding?	open("file.txt", encoding="utf-8")	open("file.txt", "utf-8")	file.set_encoding("utf-8")	read(utf8)	2	Admin
25	What does the "with" statement do when working with files?	Automatically closes file	Writes to file	Deletes file	Locks file	3	Admin
26	How do you list all files in a directory?	os.listdir()	os.files()	dir()	get.files()	3	Admin
27	What does os.path.join() do?	Builds path strings in a cross-platform way	Joins files	Copies a file	Removes spaces	3	Admin
28	Which module is used to copy files?	shutil	os	copy	fileutil	3	Admin
29	What does os.makedirs("dir") do?	Creates nested directories	Lists subdirectories	Deletes folders	Renames directories	3	Admin
30	What does file.flush() do?	Forces write buffer to disk	Reads file	Locks the file	Empties the file	3	Admin
31	What does os.path.isfile(path) check?	If the path is a file	If the file is open	If it is writable	If it is binary	3	Admin
32	How do you handle file read errors safely?	Use try-except block	Use if-else	Call close() first	Check length of file	3	Admin
33	What does os.path.basename(path) return?	The file name only	The full path	The file type	The file contents	3	Admin
34	How do you write JSON data to a file?	Use json.dump(data, file)	Use file.write_json()	Use json.save()	file.write(json(data))	3	Admin
35	How do you read a file line by line using a loop?	for line in file	while file:	read(file)	loop(file.lines)	3	Admin
36	Which function gives current working directory?	os.getcwd()	os.pwd()	os.curdir()	file.cwd()	3	Admin
37	What happens if you don´t close a file?	It may cause memory/resource leaks	It deletes the file	It prints an error	It overwrites data	5	Admin
38	What does io.StringIO provide?	In-memory text stream	Stream from stdin	Binary reader	Thread-safe file object	5	Admin
39	What does io.BytesIO provide?	In-memory binary stream	Byte counter	Encrypts file	Encodes UTF-8	5	Admin
40	How do you get file size?	os.path.getsize("file.txt")	file.size()	os.file_length()	file.len()	5	Admin
41	How do you make sure writing to file is atomic?	Write to temp file then rename	Use try-except	Lock file	Flush twice	5	Admin
42	What is the advantage of using pathlib?	Object-oriented file path operations	Faster reads	Better encryption	Simpler encoding	5	Admin
43	How do you append binary data?	Open file in "ab" mode	Use "rb+"	Use os.append()	file.writeb()	5	Admin
44	What happens if two scripts open the same file in write mode?	Race condition, possible data loss	They merge writes	File is locked	Python blocks second script	5	Admin
45	What does file.tell() return?	Current cursor position in file	Total lines in file	Byte count	File size	5	Admin
46	How do you create a temp file?	tempfile.NamedTemporaryFile()	os.mkfile()	file.create()	shutil.tmp()	5	Admin
47	What is the difference between "w" and "x" modes?	"w" overwrites, "x" fails if file exists	"x" is faster	"w" writes binary, "x" writes text	They’re aliases	5	Admin
48	What does open(file, "r+", encoding="utf-8") mean?	Read and write with UTF-8 encoding	Append in UTF-8	Read only	Write binary	5	Admin
49	What happens if you write a string to a file opened in binary mode?	TypeError is raised	It gets converted	It is encoded automatically	It is ignored	5	Admin
50	What does os.fsync(f.fileno()) do?	Forces file content to be written to disk	Closes the file	Flushes the buffer	Copies file to memory	5	Admin
51	Which mode do you use to only read from a file?	"r"	"w"	"a"	"x"	1	Admin
52	Which method returns an empty string when the end of a file is reached?	read()	readline()	readlines()	readall()	1	Admin
53	What does f = open("data.txt", "a") do?	Opens the file for appending	Opens file for reading	Overwrites the file	Deletes the file	1	Admin
54	Which module provides access to file system functions?	os	sys	io	fs	1	Admin
55	How do you add a newline to written content?	Include "\\\\n" in the string	Use file.newline()	Call newline()	Write a blank string	1	Admin
56	Which function closes an open file?	close()	exit()	stop()	end()	1	Admin
57	Which method returns the file content line by line in a list?	readlines()	read()	readline()	lines()	1	Admin
58	What does open("file.txt", "w") do if the file exists?	Truncates the file	Appends to the file	Reads it	Raises an error	1	Admin
59	What file mode should you use to prevent overwriting an existing file?	"x"	"w"	"r"	"a"	1	Admin
60	Which function lets you check if a file exists?	os.path.isfile()	open()	file.exists()	check()	1	Admin
61	How do you write a list of strings to a file?	writelines()	write()	append()	putlines()	2	Admin
62	What is returned by file.read() when the file is empty?	An empty string	None	0	False	2	Admin
63	How can you move the cursor to the beginning of a file?	seek(0)	rewind()	cursor(0)	start()	2	Admin
64	Which mode would allow you to create a file only if it does not exist?	"x"	"w+"	"a+"	"r+"	2	Admin
65	What does file.tell() return?	Current cursor position	File size	Line number	File encoding	2	Admin
1	Which function is used to open a file in Python?	open()	file()	read()	get()	1	Admin
2	Which mode opens a file for reading?	"r"	"w"	"a"	"rw"	1	Admin
3	Which method reads the whole content of a file as a string?	read()	readline()	readlines()	get()	1	Admin
4	What does "w" mode do when opening a file?	Overwrites the file if it exists	Appends to the file	Reads only	Creates a copy	1	Admin
5	Which method closes a file?	close()	end()	exit()	stop()	1	Admin
6	Which method reads one line at a time?	readline()	read()	readlines()	next()	1	Admin
7	Which statement is used to safely manage file opening and closing?	with	open	if	try	1	Admin
8	What does "a" mode do?	Appends data to the end of the file	Reads only	Overwrites file	Creates a new file only	1	Admin
9	What does open("file.txt", "x") do?	Creates a new file, errors if it exists	Reads the file	Deletes the file	Overwrites if file exists	1	Admin
10	What type of data does read() return?	str	list	int	dict	1	Admin
11	Which method returns all lines in a file as a list?	readlines()	read()	readline()	fetch()	1	Admin
12	What happens if you open a non-existent file in read mode?	It raises a FileNotFoundError	It creates the file	It returns None	It opens an empty file	1	Admin
13	How do you write a string to a file?	file.write("text")	file.read("text")	file.open("text")	write(file, "text")	2	Admin
14	How do you open a file for both reading and writing?	"r+"	"rw"	"w+"	"r/w"	2	Admin
15	What type does readlines() return?	list of strings	string	dict	tuple	2	Admin
16	How do you check if a file exists before opening it?	Use os.path.exists()	Use open() and catch error	Use file.exist()	Use read()	2	Admin
66	How can you open a file for appending and reading?	"a+"	"w+"	"r+"	"x+"	2	Admin
67	What is a safe way to handle file errors?	Use try/except block	Use assert	Use print()	Ignore errors	2	Admin
68	How do you handle file encoding manually?	Pass encoding to open()	Use decode()	Use codec()	Files are always UTF-8	2	Admin
69	What happens if you call write() on a file opened in "r" mode?	Raises an error	Writes silently	Truncates the file	Creates a new file	2	Admin
70	What does the "with" statement guarantee?	Automatic file closure	Faster access	Thread safety	Read-only access	2	Admin
71	What does the following do: f.seek(0, 2)?	Moves cursor to end of file	Moves to start	Skips 2 bytes	Moves to 2nd line	3	Admin
72	What will read(5) return?	Next 5 characters	Next 5 lines	Entire file	5 bytes	3	Admin
73	What happens if you use "a" mode on a non-existent file?	It is created	An error is raised	It is read	Nothing happens	3	Admin
74	How can you read and write a file without overwriting it?	"r+"	"w"	"x"	"a"	3	Admin
75	Which method reads until a newline or EOF?	readline()	read()	readlines()	fetch()	3	Admin
76	What does os.remove("file.txt") do?	Deletes the file	Moves the file	Closes the file	Backs up the file	3	Admin
77	What is a use case for using binary file mode?	Reading images	Reading JSON	Writing text	Opening .py files	3	Admin
78	What does file.mode return?	The mode the file was opened with	The file type	The encoding	File path	3	Admin
79	Can you open two files at once in a with block?	Yes, using commas	No	Only in loops	Only with os.open	3	Admin
80	What is the result of reading a file twice without seek()?	Second read is empty	Duplicates the content	Error is raised	New cursor starts	3	Admin
81	What is the benefit of buffering in file I/O?	Improves performance by reducing disk access	Prevents data loss	Faster loading	Less RAM usage	5	Admin
82	Which function creates a temporary file?	tempfile.TemporaryFile()	open_temp()	os.tmp()	file.create_temp()	5	Admin
83	How do you open a file for both binary writing and reading?	"wb+"	"bw+"	"br+"	"wrb"	5	Admin
84	Which encoding handles most Unicode characters?	utf-8	ascii	latin1	binary	5	Admin
85	How can you append bytes to a binary file?	Use "ab" mode	Use "rb+"	Use "wb"	Use "xb+"	5	Admin
86	What does file.flush() do?	Pushes data from buffer to disk	Closes the file	Deletes buffer	Resets file	5	Admin
87	What happens when opening a directory with open()?	Raises IsADirectoryError	Reads metadata	Returns list of files	Creates new file	5	Admin
88	How can you copy file permissions from one file to another?	shutil.copymode()	os.copyperm()	fs.setperm()	copy2()	5	Admin
89	What does os.rename("a.txt", "b.txt") do?	Renames or moves the file	Copies it	Deletes it	Backs it up	5	Admin
90	What happens if you open a file with "r+b"?	Allows reading and writing in binary mode	Only reads binary	Truncates the file	Creates a new file	5	Admin
\.


--
-- Data for Name: q_functions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.q_functions (id, question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, added_by) FROM stdin;
1	Which keyword is used to define a function in Python?	def	func	function	define	1	Admin
2	How do you call a function named greet?	greet()	call greet()	greet[]	run(greet)	1	Admin
3	What is the default return value of a function if none is specified?	None	0	Empty string	False	1	Admin
4	Where do you define parameters in a function?	Inside parentheses after def	Before def	After return	Outside the function	1	Admin
5	What does return do in a function?	Sends a value back to the caller	Ends the program	Skips the loop	Restarts the function	1	Admin
6	Which of these is a valid function name?	my_function	2function	my-function	function()	1	Admin
7	How many values can a function return?	Any number	Only one	Two maximum	None	1	Admin
8	Can a function call another function?	Yes	No	Only inside loops	Only with import	1	Admin
9	Which keyword is used to exit a function early?	return	stop	exit	break	1	Admin
10	How do you pass multiple arguments to a function?	Separate them with commas	Use semicolons	Add + between them	Use []	1	Admin
11	Is it required to return a value from a function?	No	Yes	Only in Python 3+	Only with arguments	1	Admin
12	What is the output of len("abc")?	3	2	1	4	1	Admin
13	What is a parameter?	A variable in a function definition	The result of a function	The name of a function	A loop inside a function	2	Admin
14	What is an argument?	A value passed to a function	The name of a variable	A function type	A class method	2	Admin
15	How do you define a function with a default parameter?	def greet(name="Tom")	def greet(name: "Tom")	function greet(name = default)	greet(name => Tom)	2	Admin
16	What is a docstring?	A string that describes the function	A string variable	A loop inside the function	A type of comment	2	Admin
17	What does the *args syntax do?	Collects extra positional arguments	Defines an array	Creates a list	Returns all values	2	Admin
18	What does the **kwargs syntax do?	Collects extra keyword arguments	Defines a dictionary	Returns multiple results	Creates class methods	2	Admin
19	What does len() do?	Returns length of an object	Adds two numbers	Deletes data	Generates a random number	2	Admin
20	What is a lambda function?	An anonymous, one-line function	A recursive function	A built-in function	A function with no arguments	2	Admin
21	How do you write a lambda that adds two numbers?	lambda x, y: x + y	lambda(x, y) => x + y	def lambda(x, y): return x + y	x => y => x + y	2	Admin
22	What is the scope of a function variable?	Local to the function	Global	Only visible in loops	Shared between modules	2	Admin
23	What is recursion?	Function calling itself	Returning a list	Passing default values	Using *args	2	Admin
24	What does map() do?	Applies a function to each item in an iterable	Maps values to keys	Replaces items in a list	Prints a map	2	Admin
25	Can functions be assigned to variables?	Yes, functions are first-class objects	No, only strings can be	Only if decorated	Only in classes	3	Admin
26	What is a higher-order function?	Function that takes or returns another function	Function with many parameters	Only works in classes	Function with *args	3	Admin
27	What does filter() do?	Filters elements using a function	Sorts elements	Creates a generator	Maps values to keys	3	Admin
28	How do you make a function return multiple values?	Use a tuple	Return a list	Use multiple return statements	Add return after each variable	3	Admin
29	What happens if a return is not used?	Function returns None	Function crashes	Last variable is returned	Returns empty string	3	Admin
30	What does zip() do?	Combines iterables into tuples	Compresses strings	Concatenates lists	Filters elements	3	Admin
31	Can a function be nested inside another?	Yes	No	Only in Python 3+	Only with lambda	3	Admin
32	What is a decorator?	A function that modifies another function	A type of comment	A class method	A docstring alias	3	Admin
33	What does @staticmethod do?	Defines a method that does not access self	Makes the function faster	Turns return into print	Enables recursion	3	Admin
34	What does global keyword do?	Accesses a variable from the global scope	Creates new variable	Locks the variable	Makes a list global	3	Admin
35	What does enumerate() do?	Returns index and value	Sorts a list	Creates a generator	Maps function results	3	Admin
36	What is the result of bool(return)?	True, if return value is truthy	Always False	Depends on variable names	None	3	Admin
37	What happens if you mutate a default parameter like a list?	It persists across function calls	It resets every time	It raises an error	It gets garbage-collected	5	Admin
38	What is a closure in Python?	Function with access to outer variables even after outer function ends	A finished loop	A terminated function	An anonymous function	5	Admin
39	What is the result of def f(): pass; print(f())?	None	0	Error	()	5	Admin
40	What is partial() used for?	Fixing some arguments of a function	Splitting strings	Copying function	Creating decorators	5	Admin
41	What is functools.wraps used for?	Preserves metadata of wrapped functions	Wraps loops in functions	Improves performance	Hides errors	5	Admin
42	What is the purpose of nonlocal keyword?	Modify a variable in the nearest enclosing scope	Define local var	Declare global var	Create constant	5	Admin
43	What is the arity of a function?	The number of arguments it takes	Return type	Function name	Call depth	5	Admin
44	What does the yield keyword do?	Creates a generator	Returns and ends function	Raises an exception	Calls another function	5	Admin
45	Can you use return and yield in the same function?	No, not in the same code path	Yes, always	Only in Python 3.8+	Only with recursion	5	Admin
46	What is a generator expression?	(x for x in iterable)	[x for x in iterable]	def(x): yield x	map(x)	5	Admin
47	What is tail recursion?	Recursion where the recursive call is the last operation	Recursion with multiple return values	List-based recursion	Only used in loops	5	Admin
48	What does inspect.signature(func) do?	Returns function parameter signature	Measures function speed	Lists all decorators	Replaces docstring	5	Admin
49	How can you time a function´s execution?	Use time.perf_counter() before/after call	Wrap in @timeit	Use len()	Add sleep(0)	5	Admin
50	What is the difference between a function and a method?	Method is bound to object, function is not	Functions are faster	Methods return more	There is no difference	5	Admin
\.


--
-- Data for Name: q_general; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.q_general (id, question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, added_by) FROM stdin;
115	Why is 6 afraid of 7?	Because 7 8 9	Because it is bigger	Because it is spiky	Because it is prime	5	Philip
117	What is an "Easter egg" in software development?	A hidden feature or message included intentionally by developers	A type of bug that occurs only during system boot	A critical patch released without documentation	A standard encryption method used for login security	2	Philip
118	Why is 6 afraid of 7?	Because 7 8 9	Because it is pointy	Because it is prime	Because it is not nice	5	Philip
46	What is the time complexity of appending an element to a list in Python?	O(1)	O(n)	O(log n)	O(n^2)	3	Admin
1	What is the output of print(2 ** 3)?	8	6	9	5	1	Admin
2	Which of the following is a valid variable name in Python?	my_variable	2variable	my-variable	class	1	Admin
3	What function is used to get input from the user in Python?	input()	get()	read()	scan()	1	Admin
4	Which keyword is used to define a function in Python?	def	func	define	method	1	Admin
5	What will print(len("Python")) output?	6	5	7	Error	1	Admin
6	What is the result of 10 // 3 in Python?	3	3.33	4	Error	2	Admin
7	Which of these data types is immutable in Python?	tuple	list	dictionary	set	2	Admin
8	How do you open a file in write mode?	open("file.txt", "w")	open("file.txt", "r")	open("file.txt", "a")	open("file.txt", "wb")	2	Admin
9	What does the "continue" statement do in a loop?	Skips the current iteration	Exits the loop	Pauses execution	Restarts the loop	2	Admin
10	Which module is used for working with JSON data in Python?	json	pickle	os	csv	2	Admin
11	What is the output of bool([])?	False	True	None	Error	3	Admin
12	Which method is used to remove an item from a dictionary?	pop()	remove()	delete()	discard()	3	Admin
13	What is the time complexity of searching for an element in a set?	O(1)	O(n)	O(log n)	O(n^2)	3	Admin
14	How do you sort a list in descending order?	sorted(my_list, reverse=True)	my_list.sort(descending=True)	my_list.sorted(reverse=True)	sort(my_list, desc=True)	3	Admin
15	Which function is used to get the memory address of an object?	id()	address()	memory()	ptr()	3	Admin
16	What will be the output of print({1, 2, 3} & {2, 3, 4})?	{2, 3}	{1, 2, 3, 4}	{1, 4}	Error	5	Admin
17	Which of the following is a correct way to create a NumPy array?	np.array([1, 2, 3])	numpy.list([1, 2, 3])	array.numpy([1, 2, 3])	numpy.create([1, 2, 3])	5	Admin
18	What does the zip() function return?	An iterator of tuples	A list of tuples	A dictionary	A set	5	Admin
19	Which of these functions can be used to check if an object is an instance of a class?	isinstance()	issubclass()	type()	checkclass()	5	Admin
20	How can you measure the execution time of a Python script?	Using time.time() or timeit	Using sys.clock()	Using datetime.now()	Using timer()	5	Admin
21	What is the result of print(sorted([3, 1, 4], key=lambda x: -x))?	[4, 3, 1]	[1, 3, 4]	[3, 1, 4]	Error	5	Admin
22	How do you create a dictionary comprehension?	{k: v for k, v in iterable}	[k: v for k, v in iterable]	{(k, v) for k, v in iterable}	dict(k: v for k, v in iterable)	5	Admin
23	Which method in Pandas is used to drop missing values?	dropna()	remove()	delete()	clean()	5	Admin
24	How do you perform element-wise multiplication on two NumPy arrays?	array1 * array2	array1.dot(array2)	multiply(array1, array2)	elementwise(array1, array2)	5	Admin
25	Which of these decorators is used to define a static method?	@staticmethod	@classmethod	@property	@abstractmethod	5	Admin
26	What is the correct way to start a comment in Python?	# This is a comment	// This is a comment	/* This is a comment */	-- This is a comment	1	Admin
27	Which function is used to find the length of a string?	len()	length()	size()	count()	1	Admin
28	What will print(type(42)) output?	<class 'int'>	<class 'float'>	<class 'str'>	<class 'bool'>	1	Admin
29	Which keyword is used to create a loop that executes while a condition is true?	while	for	loop	repeat	1	Admin
30	What is the output of print(3 * "Hello")?	HelloHelloHello	Hello3	3Hello	Error	1	Admin
31	Which of the following is not a valid Python data type?	character	integer	boolean	string	1	Admin
32	What is the default return value of a function that does not return anything?	None	0	False	Empty string	1	Admin
33	Which operator is used to check equality in Python?	==	=	!=	===	1	Admin
34	Which function converts a string to an integer?	int()	str()	float()	bool()	1	Admin
35	What will be the output of print(10 % 3)?	1	3	0	10	1	Admin
36	What will be the output of print(bool([]))?	False	True	None	Error	2	Admin
37	How do you check the data type of a variable?	type(variable)	datatype(variable)	checktype(variable)	typeof(variable)	2	Admin
38	Which method is used to remove the last item from a list?	pop()	remove()	del()	discard()	2	Admin
39	How do you write an infinite loop in Python?	while True:	for i in range():	loop:	while 1==2:	2	Admin
40	Which built-in function returns the absolute value of a number?	abs()	round()	floor()	ceil()	2	Admin
41	How do you combine two lists in Python?	list1 + list2	combine(list1, list2)	merge(list1, list2)	list1.append(list2)	2	Admin
42	What is the output of print("python".capitalize())?	Python	PYTHON	python	P	2	Admin
43	Which symbol is used for single-line comments in Python?	#	//	--	/* */	2	Admin
44	How do you remove leading and trailing spaces from a string?	strip()	trim()	cut()	remove()	2	Admin
45	What does the enumerate() function do?	Adds an index to an iterable	Sorts a list	Converts a string to a list	Reverses a list	2	Admin
47	Which of the following is not a Python keyword?	switch	yield	with	pass	3	Admin
48	What does the zip() function do?	Combines multiple iterables into tuples	Compresses a file	Joins strings	Sorts a list	3	Admin
49	Which of the following data structures allows duplicate values?	list	set	dictionary	tuple	3	Admin
50	Which method is used to check if a key exists in a dictionary?	in	exists()	contains()	has_key()	3	Admin
51	What will be the output of print({1, 2, 3} | {3, 4, 5})?	{1, 2, 3, 4, 5}	{3}	{1, 2, 5}	Error	3	Admin
52	Which function is used to iterate over both index and value in a list?	enumerate()	range()	zip()	map()	3	Admin
53	What is the output of print("10".zfill(4))?	0010	0100	1000	Error	3	Admin
54	Which operator is used for unpacking in Python?	*	&	@	$	3	Admin
55	What is the default value of the end parameter in print()?	newline ('\\\\n')	space (" ")	dot (".")	None	3	Admin
56	What is the output of print(sorted({3: "a", 1: "b", 2: "c"}))?	[1, 2, 3]	["a", "b", "c"]	[3, 1, 2]	Error	5	Admin
57	What does the __slots__ attribute do in a class?	Limits the attributes that an instance can have	Deletes unused attributes	Defines private variables	Enforces data types	5	Admin
58	What does the "@" symbol do in Python?	Defines a decorator	Performs matrix multiplication	Creates a pointer	Declares a lambda function	5	Admin
59	Which of the following is true for Python’s Global Interpreter Lock (GIL)?	It allows only one thread to execute at a time	It improves multithreading performance	It applies to multiprocessing	It is present in all Python implementations	5	Admin
60	How does Python handle integer overflow?	Automatically converts to long integers	Throws an OverflowError	Wraps around like C	Converts to float	5	Admin
61	Which of the following is used to define an abstract method?	@abstractmethod	@classmethod	@staticmethod	@final	5	Admin
62	What is the output of print({1, 2, 3} & {2, 3, 4})?	{2, 3}	{1, 2, 3, 4}	{1, 4}	Error	5	Admin
63	Which method in Pandas is used to fill missing values?	fillna()	replace()	impute()	fill()	5	Admin
64	Which library is used for working with regular expressions in Python?	re	regex	regexp	string	5	Admin
65	What is the difference between deep copy and shallow copy?	Deep copy creates independent copies	Shallow copy copies references only	Shallow copy duplicates objects completely	They are the same	5	Admin
66	Which of the following is used to output something in Python?	print()	echo()	console.log()	printf()	1	Admin
67	How do you assign the value 10 to a variable called x?	x = 10	int x = 10	x := 10	let x = 10	1	Admin
68	Which keyword is used to define a function?	def	func	function	define	1	Admin
69	Which symbol is used to multiply numbers in Python?	*	x	^	×	1	Admin
70	How do you write a string in Python?	"text"	`text`	[text]	(text)	1	Admin
71	What does the input() function do?	Reads user input	Prints output	Stops program	Clears screen	1	Admin
72	Which of the following is a boolean value in Python?	True	"true"	1	Yes	1	Admin
73	What will be the output of print(2 + 3)?	5	23	6	Error	1	Admin
74	Which of these is used to store multiple values in order?	list	int	bool	str	1	Admin
75	How do you start an if-statement in Python?	if condition:	if (condition) then	if condition then	when condition	1	Admin
76	What does indentation indicate in Python?	Code block	Comment	Loop	Nothing	1	Admin
77	Which data type is used for decimal numbers?	float	int	decimal	double	1	Admin
78	What is the result of 5 // 2 in Python?	2	2.5	3	Error	2	Admin
79	How do you define a list in Python?	[1, 2, 3]	{1, 2, 3}	(1, 2, 3)	<1, 2, 3>	2	Admin
80	Which method adds an item to the end of a list?	append()	insert()	add()	push()	2	Admin
81	Which function converts a float to an int?	int()	float()	str()	bool()	2	Admin
82	What is the result of "3" + "4"?	"34"	7	Error	12	2	Admin
83	Which function returns the largest value from a list?	max()	top()	biggest()	largest()	2	Admin
84	How do you write an else-if condition?	elif	elseif	else if	ifelse	2	Admin
85	What does the range(3) function return?	[0, 1, 2]	[1, 2, 3]	[0, 1, 2, 3]	[1, 2]	2	Admin
86	What is the purpose of the continue statement?	Skips to next iteration	Ends loop	Pauses program	Repeats iteration	2	Admin
87	Which symbol is used for exponentiation?	**	^	exp()	^^	2	Admin
88	How do you access the first item in a list `mylist`?	mylist[0]	mylist(1)	mylist{0}	mylist.1	2	Admin
89	Which of the following can be used as keys in a dictionary?	Immutable types	Lists	Sets	All data types	2	Admin
90	What will be the output of bool(0)?	False	True	None	Error	3	Admin
91	What is the difference between == and is?	== compares values, is compares identity	They are the same	== checks identity	is compares types	3	Admin
92	Which built-in function returns the memory location of an object?	id()	loc()	mem()	addr()	3	Admin
93	What is a lambda function?	Anonymous function	Built-in function	Decorator	Class method	3	Admin
94	How do you define a tuple?	(1, 2, 3)	[1, 2, 3]	{1, 2, 3}	tuple(1, 2, 3)	3	Admin
95	Which statement is used to handle exceptions?	try...except	try...catch	if...error	test...fail	3	Admin
96	Which method removes all items from a list?	clear()	remove()	delete()	empty()	3	Admin
97	Which keyword is used to inherit from a class?	class Child(Base):	class Child < Base:	inherit Base	extends Base	3	Admin
98	How do you read a file line by line in Python?	for line in file:	while file.read():	file.readlines()	loop file	3	Admin
99	Which method converts a string to lowercase?	lower()	down()	small()	min()	3	Admin
100	What will len(set([1,2,2,3])) return?	3	4	2	1	3	Admin
101	What happens if you access a non-existent key in a dictionary using square brackets?	KeyError	None	False	Empty string	3	Admin
102	Which of these statements defines a generator?	yield	return	async	pass	5	Admin
103	What is a metaclass in Python?	A class of a class	A special decorator	A type hint	A memory model	5	Admin
104	How do you create a virtual environment in Python 3?	python3 -m venv env	virtualenv3 env	py -new env	pip install env	5	Admin
105	What will be the result of: [i for i in range(5) if i % 2 == 0]?	[0, 2, 4]	[1, 3]	[0, 1, 2, 3, 4]	[2, 4]	5	Admin
106	What does functools.lru_cache do?	Caches function return values	Logs recent usage	Speeds up disk I/O	Tracks recursion depth	5	Admin
107	How do you define an asynchronous function?	async def func():	def async func():	await def func():	def func() async:	5	Admin
108	What is monkey patching?	Changing behavior at runtime	Fixing a syntax bug	Patching a memory leak	Binding methods at compile time	5	Admin
109	How are Python lists stored in memory?	As dynamic arrays	As linked lists	As static arrays	As hash tables	5	Admin
110	What is the purpose of __name__ == "__main__"?	To execute code only when script is run directly	To check for module import	To define entry point in all Python scripts	To declare a class name	5	Admin
111	What does "nonlocal" do in nested functions?	Modifies variable in enclosing scope	Creates a global variable	Declares a class-level variable	Ignores variable in outer scope	5	Admin
112	What is the output of print({1,2,3}.difference({2,3,4}))?	{1}	{2, 3}	{4}	Error	5	Admin
113	How do you safely open a file for reading?	with open("file.txt", "r") as f:	open("file.txt")	read("file.txt")	file("file.txt").open()	5	Admin
114	What is the main purpose of the `__init__` method in a class?	Initialize object attributes	Allocate memory	Import modules	Declare variables	5	Admin
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.topics (id, topic) FROM stdin;
1	general
2	functions
3	classes
4	file handling
\.


--
-- Name: classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.classes_id_seq', 90, true);


--
-- Name: file_handling_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.file_handling_id_seq', 90, true);


--
-- Name: functions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.functions_id_seq', 91, true);


--
-- Name: general_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.general_id_seq', 118, true);


--
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.player_id_seq', 12, true);


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topics_id_seq', 4, true);


--
-- Name: q_classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.q_classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- Name: q_file_handling file_handling_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.q_file_handling
    ADD CONSTRAINT file_handling_pkey PRIMARY KEY (id);


--
-- Name: q_functions functions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.q_functions
    ADD CONSTRAINT functions_pkey PRIMARY KEY (id);


--
-- Name: q_general general_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.q_general
    ADD CONSTRAINT general_pkey PRIMARY KEY (id);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

