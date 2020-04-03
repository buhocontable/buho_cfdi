module BuhoCfdi
  require 'openssl'
 
  class Certificate
     
    attr_reader :certificate_number, :data
 
    def initialize (file)
      if file.is_a? String
        file = File.read(file)
      end
      super file
      
      @certificate_number = '';
      self.serial.to_s(16).scan(/.{2}/).each { |v| @certificate_number += v[1]; }
      @data = self.to_s.gsub(/^-.+/, '').gsub(/\n/, '')
      
    end

    def certificate(invoice)
      invoice.certificate_number = @certificate_number
      invoice.certificate = @data
    end

  end
end