s/\(CMD_RSYNC = "\).*/CMD_RSYNC = "rsync -ave \\"ssh -i <SSH_PRIVATE_KEY_FILE>\\" <SOURCE_FOLDER> <USERNAME>@<HOST>:<DESTINATION_FOLDER>"/
s/\(WATCH_PATH = "\).*/WATCH_PATH = "<FOLDER>"/