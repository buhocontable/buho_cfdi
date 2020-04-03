module BuhoCfdi
  require 'openssl'
   
  class Key

    attr_reader :private_key

    def initialize(file, password=nil)
      if file.is_a? String
        @private_key = File.read(file)
      end
    end

    def seal(invoice)
      original_string = original_string(invoice)
      private_key = OpenSSL::PKey::RSA.new(@private_key)
      digester    = OpenSSL::Digest::SHA256.new
      signature   = private_key.sign(digester, chain)
      signature   = Base64.strict_encode64(signature)
      signature
    end

    def original_string(invoice)
        invoice       = invoice
        xslt      = Nokogiri::XSLT(File.read('../cadenaoriginal_3_3.xslt'))
        chain     = xslt.transform(invoice)
        chain.text.gsub("\n","")
    end
  end
end