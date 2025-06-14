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

    void sendSample(U16 sample);
};

}  // namespace TestModule

#endif
