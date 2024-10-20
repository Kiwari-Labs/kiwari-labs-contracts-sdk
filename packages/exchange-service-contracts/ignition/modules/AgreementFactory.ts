import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const AgreementFactoryModule = buildModule("AgreementFactoryModule", (m) => {
  const agreementFactory = m.contract("AgreementFactory");

  return { agreementFactory };
});

export default AgreementFactoryModule;
