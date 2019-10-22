function tests = testFileHandling()
    tests = functiontests(localfunctions);
end

function testMakeFilename(testCase)
    testVariable = 5;
    testString = "test";
    testBoolean = true;
    testDecimal = 5.5;
    actual = makeFilename("prefix", testVariable, testString, testBoolean, testDecimal);
    expected = "prefix-5-test-true-5_5";
    verifyEqual(testCase, actual, expected)
end

function testSaveAndLoadData(testCase)
    val = 1; vec = [1, 1]; k = 1; R = 1; cotbeta = 1; S = 1; AD = 1; AT = 1;
    AB = 1; AK = 1; AI = 1; modes = 1; numberOfPolynomials = 1;
    saveData("test", val, vec, k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials);
    actual = loadData("test", val, vec, k, R, cotbeta, S, AD, AT, AB, AK, AI, modes, numberOfPolynomials);
    expected = struct("val", val, "vec", vec, "k", k, "R", R, "cotbeta", ...
        cotbeta, "S", S, "AD", AD, "AT", AT, "AB", AB, "AK", AK, "AI", AI, ...
        "modes", modes, "numberOfPolynomials", numberOfPolynomials);
    verifyEqual(testCase, actual, expected)
end
