module BuhoCfdi
  require 'openssl'
   
  class Key

    attr_reader :private_key

    def initialize(file, password=nil)
      if file.is_a? String
        @private_key = File.read(file)
      end
    end

    def seal(xml)
      xml = Nokogiri::XML(xml)
      signature = generate_seal(xml)
      xml.at_css('cfdi|Comprobante').set_attribute('Sello',signature)
      xml.to_xml
    end

    def generate_seal(xml)
      chain     = original_chain(xml)
      key = OpenSSL::PKey::RSA.new(@private_key)
      digester    = OpenSSL::Digest::SHA256.new
      signature   = key.sign(digester, chain)
      signature   = Base64.strict_encode64(signature)
      signature
    end

    def original_chain(invoice)
        invoice   = invoice
        xslt      = Nokogiri::XSLT(File.read('../cadenaoriginal_3_3.xslt'))
        chain     = xslt.transform(invoice)
        chain.text.gsub("\n","")
    end
  end
end