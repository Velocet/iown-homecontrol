AES-CBC requires an IV. You can however set the IV to all zeros. As the IV is XOR'ed with the first block of plaintext before encryption, this comes down to having no IV at all: you would directly encrypt the first block of plaintext with the block cipher.
Note that creating multiple ciphertext with the same key and IV will not result in a secure cipher. For CBC it is required to have a random (or at least unpredictable) IV. Otherwise an attacker can at least see which plaintext start with identical blocks of data.
The IV always consists of 16 bytes for AES, which comes down to 32 hexadecimal zeros, of course for the -iv command line parameter of openssl.
A key for AES can be 16, 24 or 32 randomized bytes - nothing more, nothing less. You can use a password hash (with salt and iteration count) to generate an AES key however. That's actually the standard behavior of openssl without the -K option although it only uses a 8 byte salt and worse, a weak password hashing scheme with iteration count set to 1. That's OK as long as your password is very, very strong. It will prefix a magic and the salt to your file though and - specially for you - it will generate a key and random IV from the salt and password.


- Comparison of AES stream cipher modes - Encryption only:
    Generate a pseudo random stream of data that may or may not depend the plaintext.
    Similarly to stream ciphers generally, the generated pseudo random stream is XORed with the plaintext to generate the ciphertext.
    As you can use as many bits of the random stream as you like you don't need padding at all.

    Disadvantage of this simplicity is that the encryption is completely malleable, meaning that the decryption can be changed by an attacker in any way he likes as for a plaintext p1, a ciphertext c1 and a pseudo random stream r and attacker can choose a difference d such that the decryption of a ciphertext c2=c1⊕d is p2 = p1⊕d, as p2 = c2⊕r = (c1 ⊕ d) ⊕ r = d ⊕ (c1 ⊕ r). Also the same pseudo random stream must never be used twice as for two ciphertexts c1=p1⊕r and c2=p2⊕r, an attacker can compute the xor of the two plaintexts as c1⊕c2=p1⊕r⊕p2⊕r=p1⊕p2. That also means that changing the message requires complete reencryption, if the original message could have been obtained by an attacker. All of the following steam cipher modes only need the encryption operation of the block cipher, so depending on the cipher this might save some (silicon or machine code) space in extremely constricted environments.
  - OFB creates a pseudo random stream independent of the plaintext,
        different pseudo random streams are obtained by starting with a different nonce or random IV for every message,
        as with CTR using nonces message encryption is possible without per message randomness,
        as with CTR transmission errors only effect the wrong bits and nothing more
  - OFB An IV-based encryption scheme, the mode is secure as a probabilistic encryption scheme, achieving indistinguishability from random bits, assuming a random IV.
        Confidentiality is not achieved if the IV is a nonce, although a fixed sequence of IVs (eg, a counter) does work fine.
        Ciphertexts are highly malleable. No CCA security. Encryption and decryption inefficient from being inherently serial.
        Natively encrypts strings of any bit length (no padding needed).
  - CFB creates a pseudo random stream dependent on the plaintext,
        a different nonce or random IV is needed for every message,
        as with CTR and OFB using nonces message encryption is possible without per message randomness,
        transmission errors completely destroy the following block, but only effect the wrong bits in the current block
  - CFB An IV-based encryption scheme, the mode is secure as a probabilistic encryption scheme, achieving indistinguishability from random bits, assuming a random IV.
        Confidentiality is not achieved if the IV is predictable, nor if it is made by a nonce enciphered under the same key used by the scheme, as the standard incorrectly suggests to do.
        Ciphertexts are malleable. No CCA-security. Encryption inefficient from being inherently serial.
        Scheme depends on a parameter s, 1 ≤ s ≤ n, typically s = 1 or s = 8. Inefficient for needing one blockcipher call to process only s bits.
        The mode achieves an interesting “self-synchronization” property; insertion or deletion of any number of s-bit characters into the ciphertext only temporarily disrupts correct decryption.

  - Authenticated encryption: To prevent padding oracle attacks and changes to the ciphertext, one can compute a message authentication code (MAC) on the ciphertext and only decrypt it if it has not been tampered with.
    This is called encrypt-then-mac and should be preferred to any other order. Except for very few use cases authenticity is as important as confidentiality (the latter of which is the aim of encryption).
    Authenticated encryption schemes (with associated data (AEAD)) combine the two part process of encryption and authentication into one block cipher mode that also produces an authentication tag in the process.
    - CCM is a simple combination of CTR mode and a CBC-MAC. Using two block cipher encryptions per block it is very slow.
    - OCB is faster but encumbered by patents. For free (as in freedom) or non-military software the patent holder has granted a free license, though.
    - GCM is a very fast but arguably complex combination of CTR mode and GHASH, a MAC over the Galois field with 2^128 elements. Its wide use in important network standards like TLS 1.2 is reflected by a special instruction Intel has introduced to speed up the calculation of GHASH.
