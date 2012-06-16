our %MYHOSTS = (

    #
    # LOCAL HOST DEFINITION
    #

    localhost => {
        MACHINE  => "unknown",
        HOSTINFO => [

            # Names must be unique throughout this entire file.
            { name => "localhost", ipaddress => "127.0.0.1" },
            { name => "dev0",      ipaddress => "192.168.0.11" },
        ],
        INTERP => [

            # SSH and SCP must be defined in whatever hosts
            # could potentially the localhost from which berun
            # is initiated from.
            ## ssh and scp are required for remote host operation
            { alias => "SSH",  bin => "/usr/bin/ssh",  flags => "", default_cmd => "%i %a" },
            { alias => "SCP",  bin => "/usr/bin/scp",  flags => "", default_cmd => "%i %a" },
            { alias => "PERL", bin => "/usr/bin/perl", flags => "", default_cmd => "%i %a %f" },
            { alias => "SH",   bin => "/bin/sh",       flags => "", default_cmd => "%i %a %f" },

            # special for shebang'd files
            { alias => "SHEBANG", bin => "", flags => "", default_cmd => "" },
        ],
    },

    #
    # REMOTE HOST DEFINITION
    #

    dev1 => {
        MACHINE  => "dev1",
        HOSTINFO => [         # Names must be unique throughout this entire file.
            { name => "dev1", ipaddress => "192.168.0.21" },
        ],
        INTERP => [
            { alias => "SH", bin => "/bin/sh", flags => "", default_cmd => "%i %a %f" },
            ## ssh and scp are required for remote host operation
            { alias => "SSH", bin => "/usr/bin/ssh", flags => "", default_cmd => "%i %a" },
            { alias => "SCP", bin => "/usr/bin/scp", flags => "", default_cmd => "%i %a" },

            # special for shebang'd files
            { alias => "SHEBANG", bin => "", flags => "", default_cmd => "" },
        ],
    },

    dev2 => {
        MACHINE  => "dev2",
        HOSTINFO => [

            # Names must be unique throughout this entire file.
            { name => "dev1", ipaddress => "192.168.0.31" },
        ],
        INTERP => [
            { alias => "SH", bin => "/bin/sh", flags => "", default_cmd => "%i %a %f" },
            ## ssh and scp are required for remote host operation
            { alias => "SSH", bin => "/usr/bin/ssh", flags => "", default_cmd => "%i %a" },
            { alias => "SCP", bin => "/usr/bin/scp", flags => "", default_cmd => "%i %a" },

            # special for shebang'd files
            { alias => "SHEBANG", bin => "", flags => "", default_cmd => "" },
        ],
    },

    # END OF ENTIRE HASH..DO NOT EDIT BELOW HERE
);
