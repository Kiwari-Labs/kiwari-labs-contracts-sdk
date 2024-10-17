import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const PointFactoryModule = buildModule("PointFactoryModule", (m) => {
  const pointFactory = m.contract("PointFactory");

  return { pointFactory };
});

export default PointFactoryModule;
