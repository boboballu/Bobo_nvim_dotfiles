####### Author : tarungovindk #########
######## awk, manual #############

# awk manual
 - Recommendation - to use as a one-liner in the commandline

'
BEGIN {}                ## runs in the begining

/<search regex>/ {}     ## searches the pattern in the lines and executes the code in {}

END {}                  ## runs in the end
' filename

All the above goes inside the quote

# the above is the shorthand of the one below.
~ is the operator that's used to match the regular expression
'{if ($0 ~ /<search regex>) {}}'

Below table is the list of comparison operators
Expression	Result
x < y	True if x is less than y
x <= y	True if x is less than or equal to y
x > y	True if x is greater than y
x >= y	True if x is greater than or equal to y
x == y	True if x is equal to y
x != y	True if x is not equal to y
x ~ y	True if the string x matches the regexp denoted by y
x !~ y	True if the string x does not match the regexp denoted by y
subscript in array	True if the array array has an element with the subscript subscript


# Useful short - hands
resource : https://www.baeldung.com/linux/print-lines-between-two-patterns
eg: awk '/<start pattern>/, /<end pattern>/ {print $0}'     # print between the start and end patterns (including patterns)
eg : awk '/<search regex>/,0 {print $0}'                    # print the match to the end of the file (including the pattern line)


# Fields, records, and variables in awk
Fields:
Theory: awk generally sees each line in a text file as a new record. Each record contains a series of fields. A field is a component of a record delimited by a field separator.

eg: awk -F ',' '{print $2;}' -f colours.txt

-F os the field separator arg
-f is the file name

$0 - whole line
$1 - first field
$2 - second field
$NF - last field

Variables:
FS - field separator variable eg : BEGIN {FS = ":"}
NF - Numbner of fields variable. Stores number of fields in a record. $NF dereferences the value in the last field in the current record.
NR - record number variable. Stores the current record number. 
RS - Records are separated by a character called the record separator. By default, the record separator is the newline character

# A brief list of awk internal variables collated by chatgpt
ARGC: Argument Count
Contains the number of command-line arguments passed to the awk script.

ARGV: Array of Command-Line Arguments
Contains the command-line arguments passed to the awk script.

CONVFMT: Conversion Format
Specifies the numeric conversion format for output (default is "%.6g").

ENVIRON: Array of Environment Variables
Contains the values of the environment variables.

ERRNO: Error Number
Contains the system error code associated with the last I/O operation.

FIELDWIDTHS: Field Widths
Specifies the widths of fixed-width fields for input parsing.

FILENAME: Current File Name
Contains the name of the current input file being processed.

FNR: Record Number in File
Contains the record number within the current input file.

FS: Field Separator
Specifies the input field separator (default is whitespace).

IGNORECASE: Ignore Case
Controls whether string comparisons should ignore case.

NF: Number of Fields
Contains the number of fields in the current input record.

NR: Number of Records
Contains the total number of input records processed so far.

OFMT: Output Format
Specifies the numeric output format (default is "%.6g").

OFS: Output Field Separator
Specifies the output field separator (default is space).

ORS: Output Record Separator
Specifies the output record separator (default is newline).

RLENGTH: Length of the Matched String
Contains the length of the string matched by the match() function.

RS: Record Separator
Specifies the input record separator (default is newline).

RSTART: Start Position of the Match
Contains the index within the current record where the match() function found the matched string.

SUBSEP: Subscript Separator
Separator used in multidimensional arrays (default is "\034").

TEXTDOMAIN: Text Domain for gettext()
Specifies the text domain for translations in gettext().

FILENAME: Name of the File Being Read
Contains the name of the file currently being read.

PROCINFO: Process Information Array
Provides information about the running awk process.

# built in functions in awk
String Functions:
    gsub(r, s [, t]): Global substitution. Replaces all occurrences of the regular expression r in the string t with the string s.
    sub(r, s [, t]): Substitution. Replaces the first occurrence of the regular expression r in the string t with the string s.
    index(s, t): Returns the position of the first occurrence of string t in string s, or 0 if t is not found.
    length([s]): Returns the length of the string s.
    match(s, r [, a]): Searches the string s for the regular expression r and sets the array a with matched substrings if specified.
    split(s, a [, fs]): Splits the string s into elements of array a using the field separator fs.
    sprintf(format, expression, ...): Returns the formatted string according to the printf-style format specifier format.
    tolower(s): Converts the string s to lowercase.
    toupper(s): Converts the string s to uppercase.

Mathematical Functions:
    atan2(y, x): Returns the arctangent of y/x in radians.
    cos(x): Returns the cosine of x, where x is in radians.
    sin(x): Returns the sine of x, where x is in radians.
    exp(x): Returns the exponential value of x.
    log(x): Returns the natural logarithm of x.
    sqrt(x): Returns the square root of x.
    int(x): Returns the integer part of x, truncating towards zero.
    rand(): Returns a random floating-point number between 0 and 1.
    srand([x]): Seeds the random number generator with the integer x or with the current time if x is not provided.

I/O Functions:
    close(file): Closes an open file.
    fflush([file]): Flushes any buffered output associated with the file or standard output if not specified.
    getline: Reads the next input record from the input file.
    getline var: Reads the next input record from the input file and assigns it to variable var.
    print [...]: Prints the specified expressions to standard output.
    printf [...]: Prints the specified formatted expressions to standard output.
    system(command): Executes the shell command command and returns its exit status.

Array Functions:
    delete array[index]: Deletes an element with the specified index from the array.
    delete array: Deletes all elements of the array.
    length(array): Returns the number of elements in the array.

Miscellaneous Functions:
    getline: Reads the next input record from the input file.
    getline var: Reads the next input record from the input file and assigns it to variable var.
    next: Skips the remaining pattern-action pairs for the current input record.
    nextfile: Stops processing the current input file and moves to the next input file.

# additional functions in gawk (GNU AWK)
gensub(r, s, h [, t]): General Substitution
Similar to gsub, but allows more control over substitution. h specifies how many occurrences to substitute, and t is the target string (defaults to $0).

asort(array [, d]): Array Sort
Sorts the elements of array and returns the number of elements. Optionally, d can specify the order of sorting (default is ascending).

asorti(array [, dest [, how] ]): Array Sort by Indices
Sorts the indices of array and optionally stores them in the dest array. how specifies the sorting order.

atan2(y, x): Arctangent
Returns the arctangent of y/x in radians, with signs taken into account.

close(file [, how]): Close File or Pipe
Closes the file or pipe identified by file. how can specify how the file is to be closed.

fflush([file]): Flush Output to File or Pipe
Flushes any buffered output to the file or pipe identified by file. If file is not provided, flushes standard output.

strftime(format [, timestamp]): Format Date and Time
Returns a string representing the date and time according to format. If timestamp is not provided, the current time is used.

strptime(date [, format [, arr] ]): Parse Date and Time
Parses the string date according to format and populates the array arr with the components of the date and time.

system(command): Execute Shell Command
Executes the shell command command and returns its exit status.

tolower(str): Convert to Lowercase
Converts the string str to lowercase.

toupper(str): Convert to Uppercase
Converts the string str to uppercase.

ERRNO: Error Number
Contains the system error code associated with the last I/O operation.



-----------------------------------------------------------------------------------------------------------


## The below doc is generated by metamate

# Awk functions with examples
Here is a list of some common internal functions in awk with examples:

length(): Returns the length of a string.
eg : awk '{print length("hello")}'

split(): Splits a string into an array using a specified delimiter.
eg : awk 'BEGIN {split("apple,orange,banana", fruits, ","); print fruits[1], fruits[2], fruits[3]}'

match(): Matches a regular expression against a string.
eg : awk '/foo/{match($0, /foo/, a); print a[0]}'

gsub(): Replaces all occurrences of a substring in a string with another substring.
eg : awk '{gsub(/foo/, "bar"); print}'

sub(): Replaces the first occurrence of a substring in a string with another substring.
eg : awk '{sub(/foo/, "bar"); print}'

index(): Returns the index of the first occurrence of a substring in a string.
eg : awk '{print index("hello", "l")}'

tolower(): Converts a string to lowercase.
eg : awk '{print tolower("HELLO")}'

toupper(): Converts a string to uppercase.
eg : awk '{print toupper("hello")}'

sprintf(): Formats a string according to a specified format.
eg : awk '{print sprintf("%.2f", 123.456)}'

substr(): Extracts a substring from a string.
eg : awk '{print substr("hello", 2, 2)}'

int(): Converts a number to an integer.
eg : awk '{print int(123.456)}'

rand(): Generates a random number between 0 and 1.
eg : awk 'BEGIN {print rand()}'

NR: The total number of input records processed by awk so far.
eg : awk '{print NR}'

NF: The number of fields in the current record.
eg : awk '{print NF}'

$0: The entire current record.
eg : awk '{print $0}'

$1, $2, ..., $9: The first, second, ..., ninth field in the current record.
eg : awk '{print $1, $2}'

FILENAME: The name of the current input file.
eg : awk '{print FILENAME}'

FNR: The number of input records processed by awk from the current input file.
eg : awk '{print FNR}'

ARGV[i]: The i-th command line argument.
eg : awk '{print ARGV[1]}'

ARGC: The number of command line arguments.
eg : awk '{print ARGC}'

ENVIRON["varname"]: The value of the environment variable "varname".
eg : awk '{print ENVIRON["HOME"]}'



# gawk functions with examples
awk (GNU awk) is a version of the awk programming language that provides additional features and functions compared to the standard awk. Here is a list of some common internal functions in gawk with examples:

asort(): Sorts an array in ascending order.
eg : awk 'BEGIN {a["d"]=1; a["b"]=2; a["c"]=3; asort(a); for (i in a) print i, a[i]}'

asorti(): Sorts an array in ascending order, ignoring uppercase/lowercase differences.
eg : awk 'BEGIN {a["d"]=1; a["b"]=2; a["c"]=3; asorti(a); for (i in a) print i, a[i]}'

asortn(): Sorts an array in ascending order, treating numbers as numbers rather than strings.
eg : awk 'BEGIN {a[3]=1; a[1]=2; a[2]=3; asortn(a); for (i in a) print i, a[i]}'

gensub(): Performs a global search and replace on a string, returning the modified string.
eg : awk '{print gensub(/foo/, "bar", "g", $0)}'

strtonum(): Converts a string to a number.
eg : awk '{print strtonum("123.456")}'

strftime(): Formats a timestamp according to a specified format.
eg : awk 'BEGIN {print strftime("%Y-%m-%d %H:%M:%S", "2020-01-01 12:34:56")}'

mktime(): Converts a timestamp into a number of seconds since the Unix epoch.
eg : awk 'BEGIN {print mktime("2020-01-01 12:34:56")}'

system(): Executes a shell command and returns its exit status.
eg : awk 'BEGIN {print system("ls -l")}'

getline: Reads a line from an external file or command and appends it to the current record.
eg : awk 'BEGIN {command="echo hello"; while ((getline < command) > 0) { print $0 } }'

fork(): Creates a new process.
eg : awk 'BEGIN {print fork()}'

close(): Closes a file or pipe.
eg : awk 'BEGIN {close("file.txt")}'

open(): Opens a file or pipe.
eg : awk 'BEGIN {open("file.txt", "r")}'

pclose(): Closes a pipe and waits for the command to finish.
eg : awk 'BEGIN {print pclose("ls -l")}'

popen(): Opens a pipe to a command.
eg : awk 'BEGIN {print popen("ls -l")}'

rand(): Generates a random number between 0 and 1.
eg : awk 'BEGIN {print rand()}'
