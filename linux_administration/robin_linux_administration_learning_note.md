# 20 Linux Commands Every Sysadmin Should Know
---

1. `curl`
	- transfer a URL
	- support HTTP, HTTPS, FTP, FTPS, SCP, SFTP, TFTP, DICT, TELNET, LDAP or FILE
	- `curl https://domain.com/`
		- display the content of the URL on your terminal.
	- `curl -o website https://domain.com/`
		- save the output of a cURL as $website.
	- `curl -O https://domain.com/file.zip`
		- download files with cURL
		- `curl -o archive.zip https://domain.com/file.zip` can do the same thing but change the file name.
		- You can also download multiple files by `curl -O https://domain.com/file.zip -O https://domain.com/file2.zip`
		- `curl -u user sftp://server.domain.com/path/to/file`
			- download files securely via SSH
	- `curl -I http://domain.com`
		- get HTTP header information
		- here is am example:
			- `HTTP/1.1 200 OK
			Date: Sun, 16 Oct 2016 23:37:15 GMT
			Server: Apache/2.4.23 (Unix)
			X-Powered-By: PHP/5.6.24
			Connection: close
			Content-Type: text/html; charset=UTF-8`
	- `curl ftp://ftp.domain.com --user username:password`
		- access your FTP server with password
	- `curl ftp://ftp.domain.com/filename.extension --user username:password`
		- connect to FTP server and list all files and directories.
	- `curl -T filename.extension ftp://ftp.domain.com/ --user username:password`
		- upload a file onto the FTP server.
	- `curl -I -s myapplication:5000`
		- The -I option shows the header information and the -s option silences the response body.
		- here is an output sample:
			- `HTTP/1.0 500 INTERNAL SERVER ERROR` 
2. `python -m json.tool / jq`	
	- compare the difference:
		- `cat test.json`
			- `{"title":"Person","type":"object","properties":{"firstName":{"type":"string"},"lastName":{"type":"string"},"age":{"description":"Age in years","type":"integer","minimum":0}},"required":["firstName","lastName"]}`
		- `cat test.json | python -m json.tool`
			- ```
			{
    "properties": {
        "age": {
            "description": "Age in years",
            "minimum": 0,
            "type": "integer"
        },
        "firstName": {
            "type": "string"
        },
        "lastName": {
            "type": "string"
        }
    },
    "required": [
        "firstName",
        "lastName"
    ],
    "title": "Person",
    "type": "object"
}
			```
		- `cat test.json | jq` (you must install jq first.)
			- ```
			{
  "title": "Person",
  "type": "object",
  "properties": {
    "firstName": {
      "type": "string"
    },
    "lastName": {
      "type": "string"
    },
    "age": {
      "description": "Age in years",
      "type": "integer",
      "minimum": 0
    }
  },
  "required": [
    "firstName",
    "lastName"
  ]
}
			```

