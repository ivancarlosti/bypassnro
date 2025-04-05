# Bypass Network Readiness Operations
A simple script to bypass NRO, required online Microsoft Account during Windows 11 installation

<a target="_blank" href="https://github.com/ivancarlosti/bypassnro"><img src="https://img.shields.io/github/stars/ivancarlosti/bypassnro?style=flat" /></a>
<a target="_blank" href="https://github.com/ivancarlosti/bypassnro"><img src="https://img.shields.io/github/last-commit/ivancarlosti/bypassnro" /></a>
[![GitHub Sponsors](https://img.shields.io/github/sponsors/ivancarlosti?label=GitHub%20Sponsors)](https://github.com/sponsors/ivancarlosti)

# Instructions
1. Download project files ([here](https://github.com/ivancarlosti/bypassnro/zipball/master))
2. Extract the files into a flash drive (you can use the same flash drive used to install Windows or any other acessible storage device)
3. During Windows Installation, when it asks for a Microsoft account, press Shift + F10 to open Command Prompt
4. Reach the flash drive letter (`D:`, `E:`, `F:`... you can try each letter and check drive content using command `dir`)
5. Execute the batch file `bypass.bat`, just type the filename on Command Prompt after opening drive letter
6. The system will reboot
7. Proceed with Windows 11 installation without online account
8. As soon you complete the installation, you can execute the bath file `restore.bat` to recover network connectivity.

---

## Donation

| If you found this project helpful, consider |
| :---: |
[**buying me a coffee**][buymeacoffee], [**donate by paypal**][paypal], [**sponsor this project**][sponsor] or just [**leave a star**](../..)⭐
|Thanks for your support, it is much appreciated!|

## License

[MIT](LICENSE) © [Ivan Carlos][ivancarlos]

[cc]: https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-code-of-conduct-to-your-project
[contributing]: https://docs.github.com/en/articles/setting-guidelines-for-repository-contributors
[security]: https://docs.github.com/en/code-security/getting-started/adding-a-security-policy-to-your-repository
[support]: https://docs.github.com/en/articles/adding-support-resources-to-your-project
[it]: https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/configuring-issue-templates-for-your-repository#configuring-the-template-chooser
[prt]: https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository
[funding]: https://docs.github.com/en/articles/displaying-a-sponsor-button-in-your-repository
[ivancarlos]: https://ivancarlos.me
[buymeacoffee]: https://www.buymeacoffee.com/ivancarlos
[paypal]: https://icc.gg/donate
[sponsor]: https://github.com/sponsors/ivancarlosti
