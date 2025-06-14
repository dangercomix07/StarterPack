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

    //! Handler implementation for spiRead
    //!
    //! Input port for receiving commands from SPI Driver
    void spiRead_handler(FwIndexType portNum,  //!< The port number
                         U16 sample) override;
};

}  // namespace TestModule

#endif
