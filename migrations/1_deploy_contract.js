const GYM = artifacts.require("Gym");
const MyStringUtils = artifacts.require("MyStringUtils");
module.exports = function(deployer){
    deployer.deploy(MyStringUtils);
    deployer.link(MyStringUtils, GYM);
    deployer.deploy(GYM);
}