# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Spicedb < Formula
  desc "SpiceDB is a Zanzibar-inspired database that stores, computes, and validates application permissions."
  homepage "https://authzed.com/"
  version "1.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/authzed/spicedb/releases/download/v1.9.0/spicedb_1.9.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "4d86013bd50ae4978aa189accc0dbd02caf8ad7987f702d7ef5f6906695d02cd"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/authzed/spicedb/releases/download/v1.9.0/spicedb_1.9.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "2be46acae6f3b405899c42d73d1bcda9e309cd8c491429c6e777ea8f9d6c08f1"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/authzed/spicedb/releases/download/v1.9.0/spicedb_1.9.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "7a6f501ed54fea230308c9571f23d6bab3dff165f5b45db8d81c74b6a12e909a"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/authzed/spicedb/releases/download/v1.9.0/spicedb_1.9.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "7d2f3116a5e550415a8d178e1b68dfd024ab2bfc488d1e32699d3131512b29c0"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
  end

  head "https://github.com/authzed/spicedb.git", :branch => "main"

  depends_on "go" => :build

  test do
    system "#{bin}/spicedb version"
  end
end
