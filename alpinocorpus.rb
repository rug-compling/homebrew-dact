require 'formula'

class Alpinocorpus < Formula
	url 'https://github.com/rug-compling/alpinocorpus/archive/2.8.0.tar.gz'
	homepage 'http://github.com/rug-compling/alpinocorpus'
	head 'https://github.com/rug-compling/alpinocorpus.git'
	sha256 '5d3fb5cf9d0e6b18195c789e81686cbb8d759cfd753de8ae189c1e593412d566'

	depends_on 'cmake' => :build
	depends_on 'boost'
	depends_on 'patched-dbxml'

	def install
		cmake_args = std_cmake_args

		mkdir 'build' do
			system 'cmake', '..', *cmake_args
			system 'make install'
		end
	end
end
