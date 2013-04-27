require 'formula'

class Alpinocorpus < Formula
	depends_on 'cmake' => :build
	depends_on 'boost'
	depends_on 'dbxml'

	url 'https://github.com/rug-compling/alpinocorpus/tarball/2.0.2'
	homepage 'http://github.com/rug-compling/alpinocorpus'
	head 'https://github.com/rug-compling/alpinocorpus.git'
	sha1 '143b4d614f64b7fff312d48257a99b556508df8e'

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
