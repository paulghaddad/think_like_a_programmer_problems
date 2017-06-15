require "./3_4_5"

describe Cipher do
  describe "#encode" do
    context "key is not provided" do
      it "encodes a plaintext string to a ciphertext with no offset" do
        plaintext = "ZAgEP!Hy@T"

        cipher = Cipher.new(string: plaintext)

        expect(cipher.encode).to eq("ZAgEP!Hy@T")
      end
    end
  end

  context "key is provided" do
    it "encodes a plaintext string to a ciphertext string with an offset" do
      plaintext = "ZAgEP!HY@T"

      cipher = Cipher.new(string: plaintext, key: 2)

      expect(cipher.encode).to eq("BCgGR!JA@V")
    end
  end

  describe "#decode" do
    context "key is not provided" do
      it "decodes a ciphertext string to a plaintext string with no offset" do
        ciphertext = "ZAgEP!Hy@T"
        cipher = Cipher.new(string: ciphertext)

        expect(cipher.decode).to eq("ZAgEP!Hy@T")
      end
    end

    context "key is provided" do
      it "decodes a ciphertext string to a plaintext string with an offset" do
        ciphertext = "BCgGR!JA@V"
        cipher = Cipher.new(string: ciphertext, key: 2)

        expect(cipher.decode).to eq("ZAgEP!HY@T")
      end
    end
  end
end
