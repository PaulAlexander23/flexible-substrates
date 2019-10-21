function tests = testEigenfunctionEnergy()
    tests = functiontests(localfunctions);
end

function testEnergyOfFlatVelocityProfile(testCase)
    k = 1;
    z = linspace(0,1)';
    wavespeed = 2;
    phi = wavespeed + 0 * z;
    actual = computeEigenfunctionEnergy(k, z, phi);
    expected = zeros(100,1);
    verifyEqual(testCase, actual, expected)
end

function testEnergyOfParrallelSinVelocityProfile(testCase)
    k = 1;
    z = linspace(0,1)';
    phi = cos(2 * pi * z);
    actual = computeEigenfunctionEnergy(k, z, phi);
    expected = 8 * pi^2 * sin(2 * pi * z).^2;
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-1, 'RelTol', 1e-2)
end

function testEnergyOfNormalSinVelocityProfile(testCase)
    k = 1;
    z = linspace(0,1)';
    phi = 1i * sin(2 * pi * z);
    actual = computeEigenfunctionEnergy(k, z, phi);
    expected = 2 * sin(2 * pi * z).^2;
    verifyEqual(testCase, actual, expected)
end

function testEnergyOfSinSinVelocityProfile(testCase)
    k = 1;
    z = linspace(0,1)';
    phi = cos(2 * pi * z) + 1i * sin(2 * pi * z);
    actual = computeEigenfunctionEnergy(k, z, phi);
    expected = 8 * pi^2 * sin(2 * pi * z).^2 + 2 * sin(2 * pi * z).^2;
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-1, 'RelTol', 1e-2)
end