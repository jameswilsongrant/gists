<?php

# This is cute, https://wroot.org/posts/calling-functions-without-their-names-in-php/
# You can also inspect defined variables with get_defined_vars()

function helloWorld() {
	echo "Hello, world!".PHP_EOL;
}

var_dump(get_defined_functions());

echo "This is printed with the function name: ";
helloWorld();
echo "This is printed with the get_defined_functions() positional argument call: ";
get_defined_functions()['user'][0]();
