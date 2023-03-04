Welcome to tbldo's documentation!
=================================

.. toctree::
   :maxdepth: 2
   :caption: Contents:


Overview
========
Tbldo (table-do) is a command line utility that allows a user to run a command of their choosing
under as many different configurations as they would like, as defined by some sort of tabular
input. Let's take a look at what that means:

With tbldo, a single command that looks like this:

.. code-block:: bash

   $ <command> input1 input2 --opt1 x --opt2 y


can be scaled to thousands or more configurations like this:

.. code-block:: bash

   $ tbldo csv "<command> {input1} {input2} --opt1 {x} --opt2 {y}" config.csv

Where config.csv looks like this:

.. csv-table:: Example Configuration File
   :file: example-configs/example1.csv
   :widths: 25, 25, 25, 25
   :header-rows: 1

Tbldo takes each row in the table and executes the input command with variables (string wrapped in "{}")
substituted with the value in the column where the column name equals the variable name.
So, with the example table above, the following commands are made:

.. code-block:: bash

   $ <command> input1_1 input2_1 --opt1 x_1 --opt2 y_1
   $ <command> input1_2 input2_2 --opt1 x_2 --opt2 y_2
   $ <command> input1_3 input2_3 --opt1 x_3 --opt2 y_3
   $ <command> input1_4 input2_4 --opt1 x_4 --opt2 y_4
   $ <command> input1_5 input2_5 --opt1 x_5 --opt2 y_5
   $ <command> input1_6 input2_6 --opt1 x_6 --opt2 y_6
   $ <command> input1_7 input2_7 --opt1 x_7 --opt2 y_7
   $ <command> input1_8 input2_8 --opt1 x_8 --opt2 y_8

Usage Modes
===========
Tbldo currently supports two modes of tabular input: 'csv' which expects as input a .csv file,
and 'sql', which expects as input a sql database `connection string <https://docs.sqlalchemy.org/en/20/core/engines.html>`
and an sql query.

csv
---
The example in the overview section made use of the csv mode. Let's break it down:
In order to work with csv mode, you simply put "csv" as the first argument into tbldo. This
calls the csv subcommand in the tbldo command, the same way "git clone" calls the clone
subcommand for git.

Calling tbldo csv with the help option shows this:

.. code-block:: bash

   $ tbldo csv --help


   usage: tbldo csv [-h] [--delimiter DELIMITER] [--lineterminator LINETERMINATOR] [--quotechar QUOTECHAR] command csv

   positional arguments:
   command               The command to run and apply substitutions to
   csv                   Path to the csv file

   options:
   -h, --help            show this help message and exit
   --delimiter DELIMITER
                           The delimiter to use
   --lineterminator LINETERMINATOR
                           The new line character to use
   --quotechar QUOTECHAR
                           The quote character to use


sql
---
In order to make use of the sql version of the tool, just Pass in "sql" as the first argument.
The commands for the corresponding sql subcommand can be viewed via the help as well:

.. code-block:: bash

   $ tbldo sql --help

   usage: tbldo sql [-h] command db query

   positional arguments:
   command     The command to run and apply substitutions to
   db          database connection string
   query       The sql query that returns the table to be used. If query is an existing file, it uses the contents of the file as the
               query.

   options:
   -h, --help  show this help message and exit

Note that the input query's final statement must be one that returns a table.

Installation
============
Tbldo can be installed via pip

.. code-block:: bash

   $ pip install tbldo

License
=======
tbldo is licensed under the `MIT license. <https://github.com/thecodedog/tbldo/blob/main/LICENSE>`_
