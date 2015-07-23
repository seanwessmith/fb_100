
#!/bin/bash
while read line
do
  url="http://www.facebook.com/4"
echo $(basename "${url%%[?#]*}")
# => "path"
done < output2.txt
