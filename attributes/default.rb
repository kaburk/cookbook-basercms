if platform_family?("rhel")
	default["basercms"]["owner"] = "apache"
	default["basercms"]["group"] = "apache"
elsif platform_family?("debian")
	default["basercms"]["owner"] = "www-data"
	default["basercms"]["group"] = "www-data"
end

default["basercms"]["db"]["name"]          = "basercms"
default["basercms"]["db"]["user"]          = "basercms"
default["basercms"]["db"]["password"]      = ""
default["basercms"]["db"]["root_password"] = ""

default["basercms"]["install_path"]          = "/var/www/site"
default["basercms"]["download_link"]         = "http://basercms.net/packages/download/basercms/latest"
default["basercms"]["fix_app_baseurl_issue"] = true
