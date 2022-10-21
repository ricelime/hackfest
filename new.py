import pandas as pd

html_string = """
<table>
  <thead>
    <tr>
      <th>Course</th>
      <th>Fees</th>
      <th>Mentor</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Python</td>
      <td>2000</td>
      <td>Rajat</td>
    </tr>
    <tr>
      <td>CPP</td>
      <td>2500</td>
      <td>Shyam</td>
    </tr>
    <tr>
      <td>Java</td>
      <td>2300</td>
      <td>Newton</td>
    </tr>
  </tbody>
</table>
"""

df = pd.read_html(html_string)
print(df[0].info())

