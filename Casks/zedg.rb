cask "zedg" do
  version "1.27.0"

  on_arm do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.27.0/zedg-zh-cn-macos-aarch64-v1.27.0.dmg"
    sha256 "f1bac0eb7b20b26c4a20194baa3c0d5ba38b65a2043451ba5600fb93e2c32bfd"
  end
  on_intel do
    url "https://github.com/x6nux-oss/zed-globalization/releases/download/v1.27.0/zedg-zh-cn-macos-x86_64-v1.27.0.dmg"
    sha256 "1a8ff0ecd068a44572633655aadf7b9587c385eab3edfaf294c0a9778754e6b9"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版)"
  homepage "https://github.com/x6nux-oss/zed-globalization"

  depends_on macos: :ventura

  app "ZedG.app"

  postflight_steps do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/ZedG.app"]
  end

  zap trash: [
    "~/Library/Application Support/Zed",
    "~/Library/Caches/dev.zed.ZedG",
    "~/Library/Preferences/dev.zed.ZedG.plist",
  ]
end
