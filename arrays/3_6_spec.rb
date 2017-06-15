require "./3_6"

describe Cipher do
  describe "#encode" do
    context "key is provided" do
      it "encodes a plaintext string to a ciphertext string with an offset" do
        allow(Random).to receive(:rand).with(24).and_return(1)
        plaintext = "ZAgEP!HY@T"

        cipher = Cipher.new(string: plaintext)

        expect(cipher.encode).to eq("BCgGR!JA@V")
      end
    end
  end

  describe "#decode" do
    context "key is provided" do
      it "decodes a ciphertext string to a plaintext string with an offset" do
        allow(Random).to receive(:rand).with(24).and_return(1)
        ciphertext = "BCgGR!JA@V"
        cipher = Cipher.new(string: ciphertext)

        expect(cipher.decode).to eq("ZAgEP!HY@T")
      end
    end
  end
end
