import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const PointTokenFactoryModule = buildModule("PointTokenFactoryModule", (m) => {
  const pointTokenFactory = m.contract("PointTokenFactory");

  return { pointTokenFactory };
});

export default PointTokenFactoryModule;
