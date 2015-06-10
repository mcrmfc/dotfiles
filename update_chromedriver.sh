version=`curl -s http://chromedriver.storage.googleapis.com/LATEST_RELEASE`
echo "$(tput setaf 2)Latest version is: $version$(tput setaf 7)"
curl "http://chromedriver.storage.googleapis.com/$version/chromedriver_linux64.zip" > /tmp/chromedriver.zip
cd /tmp
rm -rf chromedirver*
unzip chromedriver.zip
mv chromedriver ~/bin
