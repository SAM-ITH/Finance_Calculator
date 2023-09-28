<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/SAM-ITH/Finance_Calculator">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Estimer</h3>

  <p align="center">
    Finance calculator to calculate the savings, loans and mortage. the app has capability to calculate one of missing parameters. this project has been done as a requirment to the 7SENG999C Mobile Application Development module.
    <br />
    <a href="https://github.com/SAM-ITH/Finance_Calculator"><strong>Course work file »</strong></a>
    <br />
    <br />
    <a href="https://github.com/SAM-ITH/Finance_Calculator">View Demo</a>
    ·
    <a href="https://github.com/SAM-ITH/Finance_Calculator/issues">Report Bug</a>
    ·
    <a href="https://github.com/SAM-ITH/Finance_Calculator/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Requirments</a>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]

- Main requirment for this project as follows 

You are to create a financial app for the iPhone. The app shall have the capability of undertaking typical financial calculations such as savings, loans, and mortgages. The app shall have the ability to solve for one unknown from the given parameters noted in bold:

- N – total number of payments (synonymous with time of loan/saving period)
- r (%) – interest rate
- P – present value
- PMT – Payment A – future value
- PayPY – number of payments per year
- CpY – number of compound payments per year
- PmtAt – payment due at the beginning or end of each period (default is END)

The app shall split typical financial problems up over typically four/five views: 1) Compound Interest savings (fixed sum investment with no further payments)
2) Savings – compound interest with regular contributions (this is savings where there might be sum invested with a subsequent further monthly contribution)
3) Loans - compound interest with regular payments 4) Mortgage
In addition to this the software shall contain a help view that will contain instructions and guidance to the user on how to use the software. You have complete freedom on how to implement this view and this can be done as separate view or modal context views for example, e.g. a pop- overview activated by a help button.


<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [Swift](https://www.swift.org)
* [SwiftUI](https://developer.apple.com/xcode/swiftui/)


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Requirments

- The software shall allow the user to estimate interest rate based on other financial data given in Table 1 - Financial parameters.
- The software shall allow the user to estimate final value based on other financial data given in Table 1 - Financial parameters.
- The software shall allow the user to estimate present value based on other financial data given in Table 1 - Financial parameters.
- The software shall allow the user to estimate the payment based on other financial data given in Table 1 - Financial parameters.
- The software shall allow the user to estimate number of payments based on other financial data given in Table 1 - Financial parameters.
- The software shall persistently save all user data. (History of all calculations)
- The software shall provide a help view Notes:

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

A user wishes to calculate the interest required to return a future value for a fixed initial investment sum over a known period of time. E.g. A user wishes to know if they invest Rs.100,000 for 5 years, what interest rate would be required to return a future value of Rs.300,000.

A user wishes to calculate the length of time (number of compound payments) required to return a future value for a known fixed initial investment given a known interest rate.

E.g. A user wished to know how long it would be before an investment of Rs.100,000 at an interest rate of 4% returned a future value of Rs.300,000.

A user wishes to calculate the initial investment (present value) that will return a known future value given a known interest rate and investment period (time).

1. For the purpose of this application all payments and compound interest and be considered to be monthly. So, for example 60 payments is equivalent to 5 years.
2. If the app is backgrounded or closed by the user or runtime, all user data will be preserved persistently and the entry text fields repopulated with the last data used when the app is started or foregrounded.
3. Compounds are monthly payments from the interest on a on savings or are the monthly interest charges on a loan.

E.g. A user wished to know how much to initially invest to get a future value of Rs.300,000 on a savings account with an interest rate of 4% over a 5-year period.
E.g. A user wished to know how much to initially invest to get a future value of Rs.500,000 on a savings account with an interest rate of 4% over a 5-year period where they make monthly payments into their savings account of Rs.10,000.

Note that loans are very similar to the above, for example, a user wished to borrow Rs.300,000, they can afford to pay Rs.35,000 a month, how many
monthly payments (remember this is the same as time) would they need to make if the best loan interest rate they could get was 7%?

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - [@Mechacoder](https://twitter.com/Mechacoder)

Project Link: [https://github.com/SAM-ITH/Finance_Calculator](https://github.com/SAM-ITH/Finance_Calculator)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/SAM-ITH/Finance_Calculator.svg?style=for-the-badge
[contributors-url]: https://github.com/SAM-ITH/Finance_Calculator/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/SAM-ITH/Finance_Calculator.svg?style=for-the-badge
[forks-url]: https://github.com/SAM-ITH/Finance_Calculator/network/members
[stars-shield]: https://img.shields.io/github/stars/SAM-ITH/Finance_Calculator.svg?style=for-the-badge
[stars-url]: https://github.com/SAM-ITH/Finance_Calculator/stargazers
[issues-shield]: https://img.shields.io/github/issues/SAM-ITH/Finance_Calculator.svg?style=for-the-badge
[issues-url]: https://github.com/SAM-ITH/Finance_Calculator/issues
[license-shield]: https://img.shields.io/github/license/SAM-ITH/Finance_Calculator.svg?style=for-the-badge
[license-url]: https://github.com/SAM-ITH/Finance_Calculator/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/samithwijesighe
[product-screenshot]: images/screenshot.png
