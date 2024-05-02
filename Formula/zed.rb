# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zed < Formula
  desc "manage Authzed from your command line."
  homepage "https://authzed.com/"
  version "0.18.1"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/authzed/zed/releases/download/v0.18.1/zed_0.18.1_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "c459e354ca42f9837a1f4ed491cec6d803501982bbd9c468065067cba562182f"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/authzed/zed/releases/download/v0.18.1/zed_0.18.1_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "f4a217a968f938c23b67a850a322fc3e499bb95159d98f47ef05f67c25e1d9e7"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/authzed/zed/releases/download/v0.18.1/zed_0.18.1_linux_amd64_gnu.tar.gz", using: CurlDownloadStrategy
      sha256 "057667596b5eb830bd37d81de9820bbe091d9267440161fa996335fb12bb261e"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/authzed/zed/releases/download/v0.18.1/zed_0.18.1_linux_arm64_gnu.tar.gz", using: CurlDownloadStrategy
      sha256 "cd223d204ee5b95f70f346725dd175aa9efbf9d5e0bbe3f1c3da6bd5788d9d67"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
  end

  head "https://github.com/authzed/zed.git", :branch => "main"

  test do
    system "#{bin}/zed version"
  end
end
