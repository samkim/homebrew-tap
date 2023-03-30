# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Spicedb < Formula
  desc "SpiceDB is a Zanzibar-inspired database that stores, computes, and validates application permissions."
  homepage "https://authzed.com/"
  version "1.18.1"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/authzed/spicedb/releases/download/v1.18.1/spicedb_1.18.1_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "b9248eccc4443ad3031312939206909c429d366a8c975e220c38b5918b62cdf7"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/spicedb/releases/download/v1.18.1/spicedb_1.18.1_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "a99d17cf9be614c3e2f452de361f6c31532d2a7167696af2e88c22e5ad118957"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/authzed/spicedb/releases/download/v1.18.1/spicedb_1.18.1_linux_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "9a802818a41d3acfbf0f841be817eb59e3e33c6751d437a0eb04671b8c378861"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/spicedb/releases/download/v1.18.1/spicedb_1.18.1_linux_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "25d6b41c20e5b70bc321e2b169aa8389841c815816f0331b45844b5f5874a00b"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
  end

  head "https://github.com/authzed/spicedb.git", :branch => "main"

  test do
    system "#{bin}/spicedb version"
  end
end
