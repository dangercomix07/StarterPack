// ======================================================================
// \title  SimSPI.hpp
// \author ameya
// \brief  hpp file for SimSPI component implementation class
// ======================================================================

#ifndef TestModule_SimSPI_HPP
#define TestModule_SimSPI_HPP

#include "Components/SimSPI/SimSPIComponentAc.hpp"

namespace TestModule {

class SimSPI : public SimSPIComponentBase {
  public:
    // ----------------------------------------------------------------------
    // Component construction and destruction
    // ----------------------------------------------------------------------

    //! Construct SimSPI object
    SimSPI(const char* const compName  //!< The component name
    );

    //! Destroy SimSPI object
    ~SimSPI();
   
   void injectSampleRequest(U8 channel, U16 sample);

  PRIVATE:
    // ----------------------------------------------------------------------
    // Handler implementations for typed input ports
    // ----------------------------------------------------------------------

    //! Handler implementation for sampleRequest
    //!
    //! Input port: receives channel request from ADC
    void sampleRequest_handler(FwIndexType portNum,  //!< The port number
                               U8 channel) override;
};

}  // namespace TestModule

#endif
