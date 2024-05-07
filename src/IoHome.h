#if !defined(_IOHOME_H)
#define _IOHOME_H

#include <RadioLib.h>

#pragma region CONST
// preamble
#define IOHOME_PREAMBLE_LEN                 (512) // Preamble Length in Bits

// sync word
#define IOHOME_SYNC_WORD                    (0x57FD99)
#define IOHOME_SYNC_WORD_LEN                (3)

// frame header
#define IOHOME_CTRLBYTE0_MODE_TWOWAY        (0x00 << 7)        //  7     7
#define IOHOME_CTRLBYTE0_MODE_ONEWAY        (0x01 << 7)        //  7     7
#define IOHOME_CTRLBYTE0_ORDER_0            (0x00 << 5)        //  7     6
#define IOHOME_CTRLBYTE0_ORDER_1            (0x01 << 5)        //  7     6
#define IOHOME_CTRLBYTE0_ORDER_2            (0x02 << 5)        //  7     6
#define IOHOME_CTRLBYTE0_ORDER_3            (0x03 << 5)        //  7     6
#define IOHOME_CTRLBYTE0_LENGTH(IOHOME_LEN) (IOHOME_LEN << 0)  //  5     0

// frame header layout
#define IOHOME_CTRLBYTE0_POS                (0x0)
#define IOHOME_CTRLBYTE1_POS                (0x1)
#define IOHOME_MAC_SOURCE_POS               (0x2)
#define IOHOME_MAC_DEST_POS                 (0x3)
#define IOHOME_MSG_LEN(MSG)                 (/* TODO get msg len*/)
#define IOHOME_NUM_COMMANDS                 (2)
#define IOHOME_CMD_0x00                     (0x00)
#define IOHOME_CMD_0x01                     (0x01)
#pragma endregion CONST

/*!
  \struct IoHomeCommands_t
  \brief Command specification structure.
*/
struct IoHomeCommands_t {
  /*! \brief Command ID */
  uint8_t cid;

  /*! \brief Command Length */
  uint8_t len;

  /*! \brief Number of Parameters */
  uint8_t pnum;

  /*! \brief Whether this command needs authentication */
  bool auth;
};
const IoHomeCommands_t CMD_TABLE[IOHOME_NUM_COMMANDS] = {
  { IOHOME_CMD_0x00, 10, 1, true },
  { IOHOME_CMD_0x01, 10, 1, true },
  // ...
};

struct NodeId {
  uint8_t n0;
  uint8_t n1;
  uint8_t n2;
};

struct IoHomeChannel_t {
  uint8_t c0;
  uint8_t c1;
};

/*!
  \class IoHomeNode
  \brief io-homecontrol node.
*/
class IoHomeNode {
  public:

    /*!
      \brief Default constructor.
      \param phy Pointer to the PhysicalLayer radio module.
      \param channel Pointer to the io-homecontrol channel to use.
    */
    IoHomeNode(PhysicalLayer* phy, const IoHomeChannel_t* channel);

    /*!
      \brief $description
      \param channel $description
      \param sourceNodeID $description
      \param destinationNodeId $description
      \param stackKey $description
      \param systemKey $description
      \returns \ref status_codes
    */
    void begin(const IoHomeChannel_t* channel, NodeId source_node_id, NodeId destination_node_id, uint8_t* stack_key, uint8_t* system_key);

    PhysicalLayer* phyLayer = NULL;
    const IoHomeChannel_t* channel = NULL;

    // configure common physical layer properties (preamble, sync word etc.)
    int16_t setPhyProperties();

    // crc16-kermit that takes a uint8_t array of even length and calculates the checksum
    static uint16_t crc16();

    // network-to-host conversion method - takes data from network packet and converts it to the host endians
    template<typename T>
    static T ntoh(uint8_t* buff, size_t size = 0);

    // host-to-network conversion method - takes data from host variable and and converts it to network packet endians
    template<typename T>
    static void hton(uint8_t* buff, T val, size_t size = 0);
};

#endif
