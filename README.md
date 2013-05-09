Instructions
============

Get the latest JRE from [Oracle's download page](http://www.oracle.com/technetwork/java/javase/downloads/jre7-downloads-1880261.html), and put it on a web server you control

Then, you'll want to set the following attributes somewhere your nodes will pick it up:

```
default[:java][:release] = "7u22"
default[:java][:checksum]["x64"] = "sha256 checksum of 64-bit installer"
default[:java][:checksum]["i586"] = "sha256 checksum of 32-bit installer"
default[:java][:mirror] = "http://dev.mycompany.co.uk/downloads/"
```

If you only deploy on 64-bit nodes, you don't need to provide 32-bit installers or checksums.
