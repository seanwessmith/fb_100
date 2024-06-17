# fb_100
Grab first ever 100 Facebook users

![alt tag](https://github.com/seanwessmith/fb_100/blob/master/fb_min.gif)

1. Click on the download zip link to the right of the page. 
2. Drag the newly downloaded folder (fb_100-master) to your desktop.
3. Open the Spotlight search field (cmd + spacebar) and search for the Terminal application.
4. Copy your cookie from a facebook network request. Right click a facebook page, select "Inspect", click the "Network" tab. Filter by "Doc" requests by clicking the "Doc" button. Click a request in the table. Scroll down to find the "Cookie:" key and copy the value.
![alt tag](https://github.com/seanwessmith/fb_100/blob/master/network_tab_cookie.png)
6. Save the cookie value in the .env file
7. Press the following to navigate to your desktop
```bash
cd desktop
cd fb_100-master
./fb.sh
```
1. Type in a name for the output file and press enter. 
2. The program will execute and tell you when it is done. 
3. Open the fb_100 folder on your desktop. 
4. Double click the text file you just named. 
5. You are now done.
