function tests = testEigenvector()
    tests = functiontests(localfunctions);
end

function testPhi(testCase)
    x = linspace(0,1)';
    chebyCoeff = [3/2,  7/4, 1/2, 1/4];
    actual = computePhi(x, [chebyCoeff, 0,0,0,0, 0,0,0, 0,0,0]');
    x = x*2 - 1;
    expected = x.^3 + x.^2 + x + 1;
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-14)
end

function testEta(testCase)
    chebyCoeff = [3/2,  7/4, 1/2, 1/4];
    val = 2 + 1i;
    vec = [chebyCoeff, 0,0,0,0, 0,0,0, 0,0,0]';
    actual = computeEta(val,vec);
    expected = 0;
    verifyEqual(testCase, actual, expected)
end

function testH(testCase)
    chebyCoeff = [3/2,  7/4, 1/2, 1/4];
    val = 2 + 1i;
    vec = [chebyCoeff, 0,0,0,0, 0,0,0, 0,0,0]';
    actual = computeH(val,vec);
    expected = -16/17 - 4i/17;
    verifyEqual(testCase, actual, expected)
end

function testU(testCase)
    x = linspace(0,1)';
    chebyCoeff = [3/2,  7/4, 1/2, 1/4];
    vec = [chebyCoeff, 0,0,0,0, 0,0,0, 0,0,0]';
    actual = computeU(x, vec);
    x = x*2 - 1;
    expected = 2 * (3 * x.^2 + 2 * x + 1);
    verifyEqual(testCase, actual, expected, 'RelTol', 1e-15)
end

function testV(testCase)
    x = linspace(0,1)';
    k = 1;
    chebyCoeff = [3/2,  7/4, 1/2, 1/4];
    phi = computePhi(x, [chebyCoeff, 0,0,0,0, 0,0,0, 0,0,0]');
    actual = computeV(k, 1i * phi);
    x = x*2 - 1;
    expected = 2 * (x.^3 + x.^2 + x + 1);
    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-14)
end
