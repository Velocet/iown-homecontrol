// Type: DriverEditor.DriverEditEncryption
// Assembly: DriverEditor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 8A23256B-446B-4C30-BD63-B9BB7150F21E
// Assembly location: \Control4\DriverEditor201\DriverEditor.exe

using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace DriverEditor
{
  public class DriverEditEncryption
  {
    private byte[] _Key = new byte[32]
    {
      (byte) 125,
      (byte) 178,
      (byte) 8,
      (byte) 192,
      (byte) 105,
      (byte) 155,
      (byte) 20,
      (byte) 180,
      (byte) 110,
      (byte) 248,
      (byte) 27,
      (byte) 151,
      (byte) 243,
      (byte) 154,
      (byte) 252,
      (byte) 152,
      (byte) 104,
      (byte) 221,
      (byte) 21,
      (byte) 143,
      (byte) 22,
      (byte) 54,
      (byte) 247,
      (byte) 244,
      (byte) 56,
      (byte) 102,
      (byte) 223,
      (byte) 229,
      (byte) 95,
      (byte) 25,
      (byte) 244,
      (byte) 152
    };
    private byte[] _IV = new byte[16];

    public void Encrypt(string data)
    {
      MemoryStream memoryStream = new MemoryStream();
      Rijndael rijndael = Rijndael.Create();
      rijndael.Mode = CipherMode.ECB;
      CryptoStream cryptoStream = new CryptoStream((Stream) memoryStream, rijndael.CreateEncryptor(this._Key, this._IV), CryptoStreamMode.Write);
      StreamWriter streamWriter = new StreamWriter((Stream) cryptoStream);
      try
      {
        streamWriter.WriteLine(data);
      }
      catch
      {
      }
      finally
      {
        streamWriter.Close();
        cryptoStream.Close();
        memoryStream.Close();
      }
    }

    public string Decrypt(string data)
    {
      MemoryStream memoryStream = new MemoryStream(Encoding.ASCII.GetBytes(data));
      Rijndael rijndael = Rijndael.Create();
      rijndael.Mode = CipherMode.ECB;
      CryptoStream cryptoStream = new CryptoStream((Stream) memoryStream, rijndael.CreateDecryptor(this._Key, this._IV), CryptoStreamMode.Read);
      StreamReader streamReader = new StreamReader((Stream) cryptoStream);
      string str = (string) null;
      try
      {
        str = streamReader.ReadLine();
      }
      catch
      {
      }
      finally
      {
        streamReader.Close();
        cryptoStream.Close();
        memoryStream.Close();
      }
      return str;
    }
  }
}
