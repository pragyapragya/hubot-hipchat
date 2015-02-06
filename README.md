# hubot-hipchat

Hubot Hipchat bot running out of docker. By default this images sets up a stock,
or close to stock hubot which can be connected to Hipchat.

You can install apps from the Scripts Catalog ( http://hubot-script-catalog.herokuapp.com/ )
By passing in the HUBOT_SCRIPTS_URL environment variable. The URL should point to a valid hubot-scripts.json file. 

``Shell
docker run -it -d -e "SERVICE_NAME=hipchat" -e HUBOT_HIPCHAT_JID=<JID>@chat.hipchat.com -e HUBOT_HIPCHAT_PASSWORD='<PW>' -e HUBOT_AUTH_ADMIN="Your Name" -e HUBOT_SCRIPTS_URL="https://gist.githubusercontent.com/tfhartmann/26325695994220a26a4e/raw/d852fb4735726474c20bb4a414693837ce464596/hubot-scripts.json" tfhartmann/hubot-hipchat
```
