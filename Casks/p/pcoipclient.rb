cask "pcoipclient" do
  version "24.10.3"
  sha256 "a618f45c4e78cc4542aa667e53d1356a34314641c5b5f0b259868e6230c263fe"

  url "https://dl.teradici.com/DeAdBCiUYInHcSTy/pcoip-client/raw/names/pcoip-client-dmg/versions/#{version}/pcoip-client_#{version}.dmg"
  name "Teradici PCoIP Software Client for macOS"
  desc "Client for VM agents and remote workstation cards"
  homepage "https://docs.teradici.com/find/product/software-and-mobile-clients/"

  livecheck do
    url "https://dl.teradici.com/DeAdBCiUYInHcSTy/pcoip-client/raw/names/pcoip-client-dmg/versions/latest/pcoip-client_latest.dmg"
    strategy :header_match
  end

  depends_on macos: ">= :monterey"

  app "PCoIPClient.app"

  uninstall quit: [
    "com.teradici.swiftclient",
    "com.teradici.usb-mediator",
  ]

  zap trash: [
    "~/Library/Preferences/com.teradici.PCoIP Client Connection Info.plist",
    "~/Library/Preferences/com.teradici.swiftclient.plist",
    "~/Library/Preferences/com.teradici.Teradici PCoIP Client.plist",
  ]

  caveats do
    license "https://docs.teradici.com/reference/eula/teradici-end-user-license-agreement"
  end
end
