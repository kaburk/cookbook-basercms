default["basercms"]["db"]["password"] = ""
default["basercms"]["db"]["name"]     = "basercms"
default["basercms"]["install_path"]   = "/var/www/site"
default["basercms"]["download_link"]  = "http://basercms.net/packages/download/basercms/latest"

if platform?("centos")
	default["basercms"]["owner"] = "apache"
	default["basercms"]["group"] = "apache"

elsif platform?("debian", "ubuntu")
	default["basercms"]["owner"] = "www-data"
	default["basercms"]["group"] = "www-data"

end

default["basercms"]["fix_app_baseurl_issue"] = true
