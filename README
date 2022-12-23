# securerun

## Executive Summary

A method of creating an XML based framework to perform automated forecasting includes sending a file from a local host computer to a remote computer, receiving a file at the local host computer from the remote computer, installing the received file on the local host computer, and executing commands
on the local host computer and the remote computer. Executing a command on the remote computer includes reading a run file and a host definition file. A framework for interacting between the local host computer and the remote computer is determined based on types of XML tags.

## Introduction

Establishing automated forecasting systems can be difficult. Engineers intending to set-up Such automated forecasting systems had to be more concerned about the mechanics of sending, receiving, and executing files than the specifications of their dynamic models. Existing approaches
are cumbersome to create custom scripts in a generic way so as to facilitate simple reuse of existing scripts prepared for other model applications.

Moreover, utilization of remote machines for the purpose of running model simulations poses additional challenges with respect to sending files to the remote locations, running scripts on remote systems, and retrieving files from the remote locations. Due to the challenges posed by
interacting with remote machines, most model forecasting applications were set up to run on a limited number of locally available computer systems, and often on a single local computer system.

Common tools that were used include shell scripts (e.g., Bourne, C-shell, etc.) that interacted with various file transfer utilities include, for example, ftp, rcp, and scp. Using such tools and methods of automating a forecast system are not only inefficient as most scripts cannot be
reused, but they also limit computing resources by making the interaction with remote machines extremely cumbersome and non-intuitive. Moreover, the resulting model run script could not be easily reused even for slightly differing scenarios with respect to either hardware (e.g. computer system) or software (e.g., applications). Additionally, such scripts would not fit into a forecasting environment when a higher level of automation is desired.

## Summary

In some embodiments, a method of creating an XML based framework to perform automated forecasting
includes sending a file from a local host computer to a remote computer, getting a file at the local host computer from the remote computer, copying the received file on the local host computer, and executing commands on the local host computer and the remote computer. Executing a command on the remote computer includes reading a run file and a host definition file. A framework for interacting between the local host computer and the remote computer is determined based on types of XML tags.

## Method

By maintaining control at the local host system, securerun ensures that a user has maximum control over the actions, thereby minimizing the user's reliance on the remote host system (e.g., remote hosting environment). The logical flow can be performed in the local host system. A run file and a host definition file are read by securerun residing in the local host system. The host definition file defines interpreters available for use with the run file (e.g., `<runfile>`) and `<script>` tags. After the runfile and the host definition file are read, the runfile (e.g., runfile.xml) is preprocessed to substitute any predefined variables.

The preprocessed run file is then parsed and securerun follows the directions that are included within the run file tags.

### Macro Processing

Securerun includes a macroprocessing routine that enables users to build templates using macros, or variables, that are defined at run time. Macro processing is a search and replace function that searches for macros within the run file or external text files, and replaces such files with their respectively defined values if they are defined by one of securerun's macro definition methods that include:

* using the `-o` flag when securerun is executed;
* using the `<define>` tag in the run file;
* capturing output from the `<script>` or `<runfile/>` tags.

Users can leverage securerun so that by simply defining a variable can alter the functionality of the application. Various built-in variables can be set at the start of an application. The built-in variables are shown in the Table below.

Name | Value | Description
-----| ----- | -----------
`%PROCID%` | The process id of the current instance of securerun. | This number is assigned by the operating system whenever Securerun is started.
`%UNIQUE%` | This macro provides a unique string each time it is encountered. | No two %unique% macros will be replaced with the same value, even within the same process.
`%BASEDIR%` | The base or "home" directory set within the opening `<securerun>` tag or changed by the `<chbasedir/>` tags. | Allows for the reference of the current base directory without having to explicitly set it with the `<define/>` tag.
`%TMPDIR%` | The temp directory used by Securerun set within the opening `<securerun>` tag. | Allows for the reference of the temp directory without having to explicitly set it with the `<define/>` tag.
`%STDOUT%` | Contains the standard output of the last `<runfile/>` or `<script>` tag that was run unless the “name” attribute was specified with either tag. | Captures the output of the last action invoked by the `<runfile/>` or `<script>` tags so that it doesn't have to be explicitly captured with the "name" attribute.

Also included in the securerun are a user's environmental variables of a local machine. Such allows for default variables set in the user's local environment to be included in the secururun, thereby eliminating the need for the user to be aware of definitions of the default variables. The user can, however, override the default values by using a `<define/>` tag in the run file and assigning a new value to the variable.

### XML Tags

Applications written within the securerun framework prefer a file (e.g., run file) that integrates (e.g., ties) distinct pieces of the application. Such distinct pieces of information could be commands, actions, scripts, standalone executables, etc. The file that integrates all the distinct pieces of the application is referred to herein as a “run file”. In a preferred embodiment, the run file is a text file (as opposed to binary) that is written using XML compliant tags configured to direct securerun's execution. The run file uses a set of tags that are specific for securerun, described in the Table below.

Tag | Description
--- | -----------
`<securerun> ... </securerun>` | Root tag - this means that all other tags must be contained within an opening `<securerun>` and closing `</securerun>` tag. Attributes include "name", "basedir", and "prefs". Example: `<securerun name=“test” basedir=“.” prefs=“-create_dirs:1;”> (all other tags here . . . ) </securerun>`
`<pfile/>` | This tag is used to put files onto remote hosts, get files from remote hosts, or copy a local file to another local directory.
`<putfile> ... </putfile>` | This tag allows multiple files to be transferred to one location by enclosing a series of `<pfile/>` tags between the opening and closing `<putfile>` tags.
`<runfile/>` | This tag is used to execute the specified file using the specified external program specified by the "interp" attribute.
`<script> ... </script>` | This tag allows the embedding of any kind of text inside of the run file The embedded text is most commonly some type of programming language meant to be read and executed by some external interpreter.
`<define/>` | This tag defines a macro variable which is then available for use by the macro processing feature.
`<undefine/>` | This tag removes a macro variable of the specified name if it exists.
`<chbasedir/>` | This tag changes the local base directory from which Securerun is executing during run time.
`<input/>` | This tag incorporates interactivity into a Securerun application by printing the specified message to the screen, and waits for a keyboard response by the user. The user input is then saved as a macro variable of the specified name.
`<output/>` | This tag simply prints a specific message to the screen.


Since the XML standard is platform neutral and self-descriptive, all the relevant data can be extracted using a generic parser.

Securerun uses the XML run file to describe the steps that an application is desired to undertake. As described above in Table 2, each XML run file includes a series of securerun specific XML tags that are used to specify an action for securerun to perform.

The tags that serve most directly to implement preferred features (e.g., transfer and execution of files) of securerun include `<pfile/>`, `<putfile>`, `<runfile/>`, and `<script>`. The `<pfile>` tag indicates to securerun to move a specified file to a specified location (e.g., any combination of remote or local locations) and can be used with `<putfile>` to transfer multiple files to a similar location. The `<runfile/>` tag indicates to securerun to execute a specified file in a specified location (e.g., local or remote or combination thereof). The `<script>` tag is a hybrid of `<pfile/>` and `<runfile/>` that allows a user to define the actual content of a text file during runtime that can be transferred to and executed on a specified host, such as, for example, on a local host system.

The opening `<securerun>` tag includes attributes that are used to set a name for the run file, designate a base directory (e.g., ‘basedir’) on a local host system where securerun is executed, and specifies exemplary run time settings (e.g., ‘prefs’) that are used by securerun.

The use of the `<pfile/>` and `<putfile>` tags are used for copying files from one location to another. The `<pfile>` tag also has the ability to be used as a standalone tag, or it can be used in a batch mode that transfers multiple files at once. The `<putfile>` tag specifies the target location in the “dir” attribute for all of the files that `<pfile>` specifies with its “file” attribute and such files are copied to a specified location.

### Execution

The `<script>` tag is used to embed text of any kind into the run file. The intended use of the `<script>` tag is to provide a way to specify and execute arbitrary programs/scripts under such  interpreters as system shells (e.g., Bourne, C-Shell, etc.), scripting languages (e.g., Perl, Python, Ruby, Matlab, etc.), and compiled languages (e.g., FORTRAN, C, C++, Java). The attribute “interp”  is used to specify an interpreter that should be used. Valid interpretors are defined for each host in the host definition file.

The `<script>` tag includes an attribute called “cmd” that enables a user to define a command format used to execute the file containing the text within the `<script>` tag. By using `%i` (interpreter), `%f` (file), and `%a` one can control how a command is issued to any interpretor that accepts command line arguments. Such a feature is also available to the `<runfile/>` tag. The Table below illustrates the formatting rules:

Formatting Variable | Description
------------------- | -----------
`%i` | In the external interpretor call, it is replaced by the interpretor specified with the “interp” attribute.
`%f` | Represents the file specified in the "file" attribute.
`%a` | Represents the values supplied in the "arg" attribute.

The ability to control the command format when calling external programs is desired for using applications such as, for example, Matlab that do not follow the conventional way of running a script at the command line. Default command formats are set in the host definition file. The remainder of the tags shown in Table 2 can be used to provide further flexibility to securerun.

In some cases, the computer system on which the application (e.g., securerun) is configured and prepared is not the same computer system that executes the application code. In such cases, there would be a need for simulations prepared on one computer system to be archived (e.g., using an application like tar) and sent to the computer system performing the computations. Once the archived files are on the remote host, such files need to be unarchived prior to initiating the application. Securerun would be able to accomplish the above tasks with relative ease. Once the application code is produced, securerun can retrieve output files for post processing on a local host system (e.g., system 102) or a remote machine (e.g., remote host 104). The processed results can be used to send deliverables (e.g., images, data sets, etc.) to the local host or predetermined remote hosts for distributing results via anonymous ftp, World Wide Web, etc.

By using a limited set of primitive instructions, one can put together a complex system that leverages both local and remote computer systems. These instructions include sending a file from a local host to a remote host, obtaining a file from the remote host and saving the obtained file on the local host, copying a file from the local host to another second location, executing a command on the remote host, and executing a command on the local host.

Securerun enables a user (e.g., applications developer) to leverage the power of multiple computers without having to be overly concerned about the nuances of transferring files and executing remote commands. The user can treat the remote machines as available resources that can be used as easily as a local host computer system. Such would be beneficial in designing and creating an automated and distributed system.

A feature of the securerun that makes the framework flexible is its ability to perform macro-processing operations as described above. By using the macros in conjunction with external files, generic scripting templates can be created. Such templates can be processed at run time to create scripts that can be customized for a task. This framework would be beneficial as there would be no need to maintain a library of differing scripts. The tags that handle files include an attribute called “process” which can be set to a “YES” or “NO” to indicate to securerun whether or not to process the file by replacing any defined macro variables with their current values. The “process” attribute is available at least for `<pfile/>`, `<runfile/>`, and `<script>` tags.

Using the securerun framework, any script or binary executable on a local host system or a remote host system can be used to put together an application. Securerun can be used to create a framework to connect system commands, scripts, and files together in order to form an application that can be configured to run automatically. Securerun can interface with various command utilities through the flexibility provided for using the “cmd” attribute in the `<script>` and `<runfile/>` tags.

Securerun can also provide user interactivity by providing an easy way to prompt users for input using, for example, the `<input/>` tag. When such a tag is encountered, securerun displays messages defined using the “msg” attribute and assigns information input by the user to a macro variable specified using a “name” attribute. If desired, this feature can be turned off with a command line flag set when executing the securerun framework.

## History

This is the reference implementation for USPTO Application 20060265469.

These files were extracted from HEAD in an old CVS repo I had backed up,
but no history is retained from before the import. I may make changes,
but this is really just to put the reference implementation on the record.

`CVS HEAD -> # $Revision: 1.136 $ $Date: 2004/03/11 23:47:59 $ $Author: estrade $`