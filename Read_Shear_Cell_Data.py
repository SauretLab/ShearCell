import requests
import re
import numpy as np
import matplotlib.pyplot as plt

def derive_raw_github_url(permalink):
    """
    Converts a GitHub permalink to a raw file URL.

    Parameters:
        permalink (str): Permalink to the GitHub file.

    Returns:
        str: Raw GitHub URL for the file.
    """
    if "github.com" in permalink and "/blob/" in permalink:
        raw_url = permalink.replace("github.com", "raw.githubusercontent.com").replace("/blob/", "/")
        return raw_url
    else:
        raise ValueError("Invalid GitHub permalink. Make sure it includes '/blob/'.")

def filter_lines_and_sort(github_url):
    """
    Reads a text file from a GitHub repository, removes all lines except those starting with specific phrases,
    extracts the numbers, sorts them into columns, and stores the result in an array.

    Parameters:
        github_url (str): Permalink to the GitHub raw text file.

    Returns:
        np.ndarray: Array with odd numbers in column 1 and even numbers in column 2.
    """
    # Define the target phrases
    target_phrases = {
        "Shear-to-failure normal stress σ_S:",
        "Yield shear stress τ_y:"
    }

    # Fetch the file content from GitHub
    response = requests.get(github_url)
    response.raise_for_status()  # Raise an error if the request fails
    lines = response.text.splitlines()

    # Extract numbers from the relevant lines
    extracted_numbers = []
    for line in lines:
        for phrase in target_phrases:
            if line.strip().startswith(phrase):
                # Extract the number after the phrase
                match = re.search(rf"{re.escape(phrase)}\s*(-?\d+(\.\d+)?)", line)
                if match:
                    extracted_numbers.append(float(match.group(1)))

    # Sort numbers into columns
    shear_cell_data = np.array(extracted_numbers).reshape(-1, 2)

    return shear_cell_data

def extract_and_regress(x, y):

    # Perform linear regression
    x_pred = np.linspace(500, 8000, 50)
    [m, c] = np.polyfit(x, y, 1)
    y_pred = m*x_pred + c

    # Plot the data and regression line
    plt.figure(figsize=(8, 6))
    plt.rc('font', family='serif')

    plt.scatter(x, y, color='blue', label='Data Points', s = 70)
    plt.plot(x_pred, y_pred, color='red', label='Linear Regression', linestyle = '--')

    # Add labels, title, and legend
    x_label = r"$\sigma_{\rm c}$"
    y_label = r"$\tau_{\rm c}$"
    plt.title("Linear Regression: {} vs. {}".format(y_label, x_label), fontsize=16)
    plt.xlabel(x_label, fontsize = 16)
    plt.ylabel(y_label, fontsize = 16)
    plt.grid(True, linestyle='--', alpha=0.6)
    plt.legend(fontsize=10)
    plt.tight_layout()
    plt.show()

    print("Yield Stress = ",c)
    print("Friction = ", m)

# Example usage
if __name__ == "__main__":
    github_permalink = "https://github.com/SauretLab/ShearCell/blob/4376e399a21b59b14cce33ffdcbf9bf79ead9b7e/Shear%20Cell%20Data/0.5%25%20Wet%20grains/1%20mm%20mm%200.5%25%20Water%20but%20aged%20over%20few%20hours.txt"

    try:
        github_url = derive_raw_github_url(github_permalink)
        shear_cell_data = filter_lines_and_sort(github_url)
        print("Shear Cell Data:")
        print(shear_cell_data)
    except Exception as e:
        print(f"Error: {e}")

    extract_and_regress(shear_cell_data[:,0], shear_cell_data[:,1])
