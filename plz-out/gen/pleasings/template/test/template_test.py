import unittest
import filecmp
import difflib

class templateTests(unittest.TestCase):
    def test_yaml_dict(self):
        expected = 'template/test/expected.yaml'
        generated = 'template/test/generated_dict.yaml'
        with open(expected) as e, open(generated) as g:
            expected_text = e.readlines()
            generated_text = g.readlines()
            for diff in difflib.unified_diff(expected_text, generated_text, fromfile = expected, tofile = generated, n = 0):
                print(diff)
        self.assertTrue(filecmp.cmp(expected, generated))
    
    def test_yaml_list(self):
        expected = 'template/test/expected.yaml'
        generated = 'template/test/generated_list.yaml'
        with open(expected) as e, open(generated) as g:
            expected_text = e.readlines()
            generated_text = g.readlines()
            for diff in difflib.unified_diff(expected_text, generated_text, fromfile = expected, tofile = generated, n = 0):
                print(diff)
        self.assertTrue(filecmp.cmp(expected, generated))


if __name__ == "__main__":
    unittest.main()
