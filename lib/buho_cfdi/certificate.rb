module BuhoCfdi
  require 'openssl'
 
  class Certificate
     
    attr_reader :certificate_number, :certificate_value
 
    def initialize (file)
      if file.is_a? String
        file = file
      end
      certificate = OpenSSL::X509::Certificate.new(file)
      @certificate_number = '';
      certificate.serial.to_s(16).scan(/.{2}/).each { |v| @certificate_number += v[1]; }
      @certificate_value = certificate.to_s.gsub(/^-.+/, '').gsub(/\n/, '')
      
    end

    def certificate(xml)
      xml = Nokogiri::XML(xml)
      xml.at_css('cfdi|Comprobante').set_attribute('NoCertificado',@certificate_number)
      xml.at_css('cfdi|Comprobante').set_attribute('Certificado',@certificate_value)
      xml.to_xml
    end

  end
end