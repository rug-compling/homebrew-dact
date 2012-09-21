require 'formula'

class Alpinocorpus < Formula
	depends_on 'cmake' => :build
	depends_on 'boost'
	depends_on 'dbxml'

	url 'https://github.com/rug-compling/alpinocorpus/tarball/1.4.0'
	homepage 'http://github.com/rug-compling/alpinocorpus'
	head 'https://github.com/rug-compling/alpinocorpus.git'
	sha1 'd19b4ed100291971227f36f4f0435d1fe3263ada'

	def install
		args = std_cmake_args
		args << '-DUSE_REMOTE_CORPUS:BOOL=OFF'

		mkdir 'build'
		cd 'build' do
			system 'cmake', '..', *args
			system 'make install'
		end
	end
end