// ======================================================================
// \title  ADC.hpp
// \author ameya
// \brief  hpp file for ADC component implementation class
// ======================================================================

#ifndef TestModule_ADC_HPP
#define TestModule_ADC_HPP

#include "Components/ADC/ADCComponentAc.hpp"

namespace TestModule {

class ADC : public ADCComponentBase {
  public:
    // ----------------------------------------------------------------------
    // Component construction and destruction
    // ----------------------------------------------------------------------

    //! Construct ADC object
    ADC(const char* const compName  //!< The component name
    );

    //! Destroy ADC object
    ~ADC();

  PRIVATE:
    // ----------------------------------------------------------------------
    // Handler implementations for typed input ports
    // ----------------------------------------------------------------------

    //! Handler implementation for spiSampleIn
    //!
    //! Input port to receive the result of SPI sample read
    void spiSampleIn_handler(FwIndexType portNum,  //!< The port number
                             U8 channel,           //!< Which ADC channel this sample came from
                             U16 value             //!< Raw ADC value from SPI
                             ) override;

  PRIVATE:
    // ----------------------------------------------------------------------
    // Handler implementations for commands
    // ----------------------------------------------------------------------

    //! Handler implementation for command RequestSample
    //!
    //! Request sample on a given channel (command from app logic)
    void RequestSample_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                  U32 cmdSeq,           //!< The command sequence number
                                  U8 channel) override;
};

}  // namespace TestModule

#endif
