require "./3_4"

describe Cipher do
  describe "#to_cipher" do
    context "key is not provided" do
      it "converts a plaintext string to a ciphertext with no offset" do
        plaintext = "ZAgEP!Hy@T"

        cipher = Cipher.new(plaintext: plaintext)

        expect(cipher.to_cipher).to eq("zagep!hy@t")
      end

      it "encrypts uppercase letters with no offset" do
        plaintext = "PAUL"

        cipher = Cipher.new(plaintext: plaintext)

        expect(cipher.to_cipher).to eq("paul")
      end
    end
  end

  context "key is provided" do
    it "converts a plaintext string to a ciphertext with an offset" do
      plaintext = "ZAgEP!HY@T"

      cipher = Cipher.new(plaintext: plaintext, key: 2)

      expect(cipher.to_cipher).to eq("bcggr!ja@v")
    end
  end
end
