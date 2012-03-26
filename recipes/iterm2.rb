unless File.exists?(node["iterm2_path"])

  remote_file "/tmp/iterm2.zip" do
    source node["iterm2_download_uri"]
    owner WS_USER
  end

  execute "unzip iTerm 2" do
    command "unzip /tmp/iterm2.zip -d /tmp/"
    user WS_USER
  end

  execute "copy iTerm2 to /Applications" do
    command "mv /tmp/iTerm.app #{Regexp.escape(node["iterm2_path"])}"
    user WS_USER
    group "admin"
  end

  ruby_block "test to see if iTerm.app was installed" do
    block do
      raise "iTerm.app was not installed" unless File.exists?(node["iterm2_path"])
    end
  end
end
