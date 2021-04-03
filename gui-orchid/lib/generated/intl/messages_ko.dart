// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko';

  static m0(price) => "현재 평균 VPN 가격은 GB 당 ${price} 입니다.";

  static m1(tickets) => "사용 가능한 최소 티켓 : ${tickets}";

  static m2(num) => "${Intl.plural(num, other: '${num}개의 홉이 구성되었습니다')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "aHopIsARemoteServerAlongYourPathTo" : MessageLookupByLibrary.simpleMessage("\'홉\'은 트래픽이 라우팅되는 인터넷 경로에있는 원격 서버입니다."),
    "aQrCodeAndTextForAllTheOrchidAccounts" : MessageLookupByLibrary.simpleMessage("이 키와 관련된 모든 Orchid 계정의 QR 코드와 텍스트는 다음과 같습니다."),
    "account" : MessageLookupByLibrary.simpleMessage("계정"),
    "accountView" : MessageLookupByLibrary.simpleMessage("계정보기"),
    "accountsAreNowOrganizedUnderTheOrchidAddressTheyAre" : MessageLookupByLibrary.simpleMessage("이제 계정이 연결된 Orchid 주소 아래에 구성됩니다."),
    "activate" : MessageLookupByLibrary.simpleMessage("활성화"),
    "active" : MessageLookupByLibrary.simpleMessage("유효한"),
    "addAccount" : MessageLookupByLibrary.simpleMessage("계정 추가"),
    "addCredit" : MessageLookupByLibrary.simpleMessage("크레딧 추가"),
    "addHop" : MessageLookupByLibrary.simpleMessage("홉 추가"),
    "addOrchidAccount" : MessageLookupByLibrary.simpleMessage("Orchid 계정 추가"),
    "advanced" : MessageLookupByLibrary.simpleMessage("고급"),
    "advancedConfiguration" : MessageLookupByLibrary.simpleMessage("고급 구성"),
    "allPurchasedAccountsUseThe" : MessageLookupByLibrary.simpleMessage("구매 한 모든 계정은"),
    "allowNoHopVPN" : MessageLookupByLibrary.simpleMessage("홉 없는 VPN 허용하기"),
    "alreadyHaveAnOrchidAccount" : MessageLookupByLibrary.simpleMessage("이미 오키드 계정이 있습니까?"),
    "amount" : MessageLookupByLibrary.simpleMessage("잔고"),
    "approximately" : MessageLookupByLibrary.simpleMessage("대략"),
    "average" : MessageLookupByLibrary.simpleMessage("평균"),
    "balance" : MessageLookupByLibrary.simpleMessage("균형"),
    "balanceTooLow" : MessageLookupByLibrary.simpleMessage("잔액이 너무 적습니다"),
    "bandwidthCost" : MessageLookupByLibrary.simpleMessage("대역폭 비용"),
    "bandwidthIsPurchasedInAVpnMarketplaceSoPriceWill" : MessageLookupByLibrary.simpleMessage("대역폭은 VPN 시장에서 구매되므로 시장 상황에 따라 가격이 변동될 수 있습니다."),
    "bandwidthValueWillVary" : MessageLookupByLibrary.simpleMessage("대역폭 값이 다를 수 있습니다"),
    "bandwidthWillFluctuateBasedOnMarketDynamics" : MessageLookupByLibrary.simpleMessage("시장 상황에 따라 대역폭이 변동합니다."),
    "basedOnYourBandwidth" : MessageLookupByLibrary.simpleMessage("대역폭 사용량에 따라"),
    "beta" : MessageLookupByLibrary.simpleMessage("베타"),
    "budget" : MessageLookupByLibrary.simpleMessage("예산"),
    "buyCredits" : MessageLookupByLibrary.simpleMessage("크레딧 구매하기"),
    "buyOrchidAccount" : MessageLookupByLibrary.simpleMessage("오키드 계정 구매하기"),
    "buyOrchidCredits" : MessageLookupByLibrary.simpleMessage("오키드 크레딧 구매"),
    "buyPrepaidCreditsToGetStartedTheresNoMonthlyFee" : MessageLookupByLibrary.simpleMessage("선불 크레딧을 구매해서 사용해보실 수 있습니다. 월 사용료는 없으며 사용하신만큼만 지불하면 됩니다."),
    "buyVpnCredits" : MessageLookupByLibrary.simpleMessage("VPN 크레딧 구매"),
    "cancel" : MessageLookupByLibrary.simpleMessage("취소"),
    "cancelButtonTitle" : MessageLookupByLibrary.simpleMessage("취소"),
    "changesWillTakeEffectInstruction" : MessageLookupByLibrary.simpleMessage("VPN을 다시 시작하시면 변경 사항이 적용됩니다."),
    "chooseKey" : MessageLookupByLibrary.simpleMessage("키 선택"),
    "chooseYourAmount" : MessageLookupByLibrary.simpleMessage("금액 선택하기"),
    "chooseYourPurchase" : MessageLookupByLibrary.simpleMessage("구매항목 선택하기"),
    "clear" : MessageLookupByLibrary.simpleMessage("삭제하기"),
    "clearAllLogData" : MessageLookupByLibrary.simpleMessage("모든 로그 데이터를 지우시겠습니까?"),
    "clearThisInProgressTransactionExplain" : MessageLookupByLibrary.simpleMessage("진행중인 트랜잭션을 삭제하기. 인앱 구매는 환불되지 않습니다. 오키드에 문의해 문제를 해결하실 수 있습니다."),
    "config" : MessageLookupByLibrary.simpleMessage("구성"),
    "configuration" : MessageLookupByLibrary.simpleMessage("구성"),
    "configurationFailedInstruction" : MessageLookupByLibrary.simpleMessage("구성을 저장하지 못했습니다. 구문을 확인한 후 다시 시도하세요."),
    "configurationManagement" : MessageLookupByLibrary.simpleMessage("구성 관리"),
    "configurationSaved" : MessageLookupByLibrary.simpleMessage("구성 저장됨"),
    "confirmDelete" : MessageLookupByLibrary.simpleMessage("삭제 확인"),
    "confirmThisAction" : MessageLookupByLibrary.simpleMessage("해당 활동 승인하기"),
    "connect" : MessageLookupByLibrary.simpleMessage("연결하기"),
    "connecting" : MessageLookupByLibrary.simpleMessage("연결 중 ..."),
    "connectionDetail" : MessageLookupByLibrary.simpleMessage("연결 세부 정보"),
    "considerAddingOxtToYourAccountBalance" : MessageLookupByLibrary.simpleMessage("계정 잔고에 OXT를 추가하십시오."),
    "considerAddingOxtToYourDepositOrMovingFundsFrom" : MessageLookupByLibrary.simpleMessage("추가 OXT를 예치하시거나 잔고에서 예치금으로의 이동을 고려하시기 바랍니다."),
    "contactOrchid" : MessageLookupByLibrary.simpleMessage("오키드에 문의하기"),
    "copied" : MessageLookupByLibrary.simpleMessage("복사 한"),
    "copy" : MessageLookupByLibrary.simpleMessage("복사"),
    "copyDebugInfo" : MessageLookupByLibrary.simpleMessage("디버그 정보 복사"),
    "copyReceipt" : MessageLookupByLibrary.simpleMessage("영수증 복사"),
    "costToRedeem" : MessageLookupByLibrary.simpleMessage("상환 비용 :"),
    "createACustomAccount" : MessageLookupByLibrary.simpleMessage("맞춤 계정 만들기"),
    "createAnOrchidAccountLinkAnExistingAccountOrImport" : MessageLookupByLibrary.simpleMessage("오키드 계정을 생성하거나 기존 계정을 연결하거나 OVPN 프로필을 가져옵니다."),
    "createFirstHop" : MessageLookupByLibrary.simpleMessage("첫 번째 홉을 생성하고 보호해보세요."),
    "createInstruction1" : MessageLookupByLibrary.simpleMessage("Orchid 홉 생성에는 Orchid 계정이 필요합니다."),
    "createInstructions2" : MessageLookupByLibrary.simpleMessage("Web3 브라우저에서 웹사이트를 열고 단계별로 따라해 주세요. 아래에 여러분의 이더리움 주소를 입력하세요."),
    "createOrLinkAnOrchidAccountImportAnOvpnProfile" : MessageLookupByLibrary.simpleMessage("Orchid 계정을 만들거나 연결하거나 OVPN 프로필을 가져 오거나 멀티 홉 연결을 시작하십시오."),
    "createOrchidAccount" : MessageLookupByLibrary.simpleMessage("Orchid 계정 생성하기"),
    "createYourFirstHopToGetStarted" : MessageLookupByLibrary.simpleMessage("시작하려면 첫 번째 홉을 만드세요."),
    "credentials" : MessageLookupByLibrary.simpleMessage("자격 증명"),
    "curation" : MessageLookupByLibrary.simpleMessage("큐레이션"),
    "curator" : MessageLookupByLibrary.simpleMessage("큐레이터"),
    "currentAvgVpnPriceIsPricePerGb" : m0,
    "customSetup" : MessageLookupByLibrary.simpleMessage("사용자 설정"),
    "defaultCurator" : MessageLookupByLibrary.simpleMessage("기본설정 큐레이터"),
    "delete" : MessageLookupByLibrary.simpleMessage("삭제"),
    "deleteAllData" : MessageLookupByLibrary.simpleMessage("모든 데이터 삭제"),
    "deleteThisOrchidKey" : MessageLookupByLibrary.simpleMessage("이 난초 키 삭제"),
    "deleteTransaction" : MessageLookupByLibrary.simpleMessage("거래 삭제하기"),
    "deletedHops" : MessageLookupByLibrary.simpleMessage("삭제한 홉 확인"),
    "deletedPacs" : MessageLookupByLibrary.simpleMessage("삭제 된 PAC"),
    "deletingThisHopWillPermanentlyRemoveTheContainedAccountInformation" : MessageLookupByLibrary.simpleMessage("이 홉을 삭제하면 포함 된 계정 정보가 영구적으로 제거됩니다."),
    "deletingThisHopWillRemoveItsConfiguredOrPurchasedAccount" : MessageLookupByLibrary.simpleMessage("이 홉을 삭제하면 구성되었거나 구매 한 계정 정보가 제거됩니다."),
    "deletingThisOrchidKeyCanCauseFundsInTheAssociated" : MessageLookupByLibrary.simpleMessage("이 Orchid 키를 삭제하면 연결된 Orchid 계정의 자금을 사용할 수 없게 될 수 있습니다."),
    "deposit" : MessageLookupByLibrary.simpleMessage("예치금"),
    "depositSizeTooSmall" : MessageLookupByLibrary.simpleMessage("예치액이 너무 적습니다"),
    "destination" : MessageLookupByLibrary.simpleMessage("대상"),
    "destinationPort" : MessageLookupByLibrary.simpleMessage("대상 포트"),
    "disconnect" : MessageLookupByLibrary.simpleMessage("분리"),
    "disconnecting" : MessageLookupByLibrary.simpleMessage("연결 해제 중 ..."),
    "eachHopAddsALayerOfIndirectionAndObfuscationTo" : MessageLookupByLibrary.simpleMessage("각 홉은 연결에 간접 및 난독 화 계층을 추가합니다."),
    "efficiency" : MessageLookupByLibrary.simpleMessage("능률"),
    "enableMultihopUi" : MessageLookupByLibrary.simpleMessage("멀티 홉 UI 활성화"),
    "enterLoginInformationInstruction" : MessageLookupByLibrary.simpleMessage("위의 VPN 제공업체에 대한 로그인 정보를 입력하세요. 그 후, 해당 업체의 OpenVPN 구성 파일 내용을 입력하세요."),
    "enterOpenvpnConfig" : MessageLookupByLibrary.simpleMessage("OpenVPN 구성 입력하기"),
    "enterOvpnCredentials" : MessageLookupByLibrary.simpleMessage("OVPN 자격 증명을 입력하십시오"),
    "enterOvpnProfile" : MessageLookupByLibrary.simpleMessage("OVPN 프로파일 입력"),
    "enterWireguardConfig" : MessageLookupByLibrary.simpleMessage("WireGuard® 구성 입력하기"),
    "enterWireguardProfile" : MessageLookupByLibrary.simpleMessage("WireGuard 프로파일 입력"),
    "enterYourCredentials" : MessageLookupByLibrary.simpleMessage("자격 증명을 입력하세요"),
    "ethPrice" : MessageLookupByLibrary.simpleMessage("ETH 가격 :"),
    "ethereumAddress" : MessageLookupByLibrary.simpleMessage("이더리움 주소"),
    "export" : MessageLookupByLibrary.simpleMessage("내보내기"),
    "exportHopsConfiguration" : MessageLookupByLibrary.simpleMessage("구성한 홉 내보내기"),
    "exportThisOrchidKey" : MessageLookupByLibrary.simpleMessage("이 난초 키 내보내기"),
    "fetchingPurchasedPAC" : MessageLookupByLibrary.simpleMessage("구매 한 PAC 가져 오기"),
    "forAnyInappPurchaseMadeBeforeTodayXdaiFundsHave" : MessageLookupByLibrary.simpleMessage("오늘 이전에 이루어진 모든 인앱 구매의 경우 xDai 자금이 동일한 계정 키에 추가되었습니다. 대역폭을 확보하십시오!"),
    "gasPrice" : MessageLookupByLibrary.simpleMessage("가스 비용 :"),
    "gb" : MessageLookupByLibrary.simpleMessage("GB"),
    "generateNewKey" : MessageLookupByLibrary.simpleMessage("새 키 생성"),
    "getHelpResolvingIssue" : MessageLookupByLibrary.simpleMessage(" 문제 해결 도움 받기."),
    "goodForAnIndividual" : MessageLookupByLibrary.simpleMessage("개인에게 좋습니다"),
    "goodForBandwidthheavyUsesSharing" : MessageLookupByLibrary.simpleMessage("대역폭이 많은 사용 및 공유에 적합"),
    "goodForBrowsingAndLightActivity" : MessageLookupByLibrary.simpleMessage("탐색 및 가벼운 활동에 적합"),
    "haveAnOrchidAccountOrOxt" : MessageLookupByLibrary.simpleMessage("오키드 계정 또는 OXT가 있으신가요?"),
    "haveAnOrchidAccountOrVpnSubscription" : MessageLookupByLibrary.simpleMessage("오키드 계정이나 구독 중인 VPN이 있나요?"),
    "heavy" : MessageLookupByLibrary.simpleMessage("무거운"),
    "help" : MessageLookupByLibrary.simpleMessage("도움말"),
    "hops" : MessageLookupByLibrary.simpleMessage("홉"),
    "host" : MessageLookupByLibrary.simpleMessage("호스트"),
    "iHaveAQRCode" : MessageLookupByLibrary.simpleMessage("QR 코드를 가지고 있습니다"),
    "iHaveAVPNSubscription" : MessageLookupByLibrary.simpleMessage("구독중인 VPN이 있습니다"),
    "iHaveOrchidAccount" : MessageLookupByLibrary.simpleMessage("오키드 계정이 있습니다"),
    "iWantToTryOrchid" : MessageLookupByLibrary.simpleMessage("Orchid를 사용해 보고 싶습니다"),
    "ifYouPlanToReuseTheAccountLaterYouShould" : MessageLookupByLibrary.simpleMessage("나중에 계정을 다시 사용하려면 먼저 \'공유 홉\'옵션을 사용하거나 설정의 구성 관리 도구를 사용하여 전체 회로 구성을 백업하여 계정을 저장해야합니다."),
    "ifYouWantToUseMultihopOpenvpnAndWireguardYoull" : MessageLookupByLibrary.simpleMessage("멀티 홉, OpenVPN 및 WireGuard를 사용하려면 멀티 홉 인터페이스를 활성화해야합니다. 크레딧을 구매하려면 멀티 홉 인터페이스를 사용 중지해야합니다."),
    "import" : MessageLookupByLibrary.simpleMessage("가져오기"),
    "importAnOrchidAccount" : MessageLookupByLibrary.simpleMessage("오키드 계정 불러오기"),
    "importHopsConfiguration" : MessageLookupByLibrary.simpleMessage("홉 구성 가져오기"),
    "importKey" : MessageLookupByLibrary.simpleMessage("키 가져오기"),
    "importThisKeyOnAnotherDeviceToShareAllThe" : MessageLookupByLibrary.simpleMessage("이 Orchid ID와 연결된 모든 Orchid 계정을 공유하려면 다른 장치에서이 키를 가져옵니다."),
    "inYourWalletBrowserInstruction" : MessageLookupByLibrary.simpleMessage("웹사이트를 지갑의 브라우저로 로드하세요."),
    "invalidCode" : MessageLookupByLibrary.simpleMessage("잘못된 코드"),
    "invalidQRCode" : MessageLookupByLibrary.simpleMessage("잘못된 QR 코드입니다"),
    "itMayContainSecretOrPersonallyIdentifyingInformation" : MessageLookupByLibrary.simpleMessage("비밀번호 또는 개인 식별 정보를 포함 할 수 있습니다."),
    "learnMore" : MessageLookupByLibrary.simpleMessage("더 알아보기."),
    "learnMoreButtonTitle" : MessageLookupByLibrary.simpleMessage("자세히 보기"),
    "legal" : MessageLookupByLibrary.simpleMessage("적법한"),
    "linkAnOrchidAccount" : MessageLookupByLibrary.simpleMessage("오키드 계정 연결하기"),
    "linkYourExistingOrchidAccountOrEnterAnOvpnProfile" : MessageLookupByLibrary.simpleMessage("기존 오키드 계정을 연결하거나 OVPN 프로필을 입력하십시오."),
    "loadMsg" : MessageLookupByLibrary.simpleMessage("시작하려면"),
    "loading" : MessageLookupByLibrary.simpleMessage("로드 중 ..."),
    "log" : MessageLookupByLibrary.simpleMessage("로그"),
    "logging" : MessageLookupByLibrary.simpleMessage("벌채 반출"),
    "loggingEnabled" : MessageLookupByLibrary.simpleMessage("로깅 가능"),
    "longerTermUsage" : MessageLookupByLibrary.simpleMessage("장기 사용"),
    "manageAccounts" : MessageLookupByLibrary.simpleMessage("계정 관리"),
    "manageConfiguration" : MessageLookupByLibrary.simpleMessage("구성 관리"),
    "manageProfile" : MessageLookupByLibrary.simpleMessage("프로필 관리"),
    "marketStats" : MessageLookupByLibrary.simpleMessage("시장 현황"),
    "maxFaceValue" : MessageLookupByLibrary.simpleMessage("최대 액면가 :"),
    "minTicketsAvailableTickets" : m1,
    "more" : MessageLookupByLibrary.simpleMessage("더 보기"),
    "myOrchidAccount" : MessageLookupByLibrary.simpleMessage("내 Orchid 계정"),
    "needAnAccount" : MessageLookupByLibrary.simpleMessage("계정이 필요하신가요?"),
    "needMoreHelp" : MessageLookupByLibrary.simpleMessage("추가 도움이 필요합니다"),
    "newContent" : MessageLookupByLibrary.simpleMessage("신규 콘텐츠"),
    "newHop" : MessageLookupByLibrary.simpleMessage("신규 홉 구성하기"),
    "newInterface" : MessageLookupByLibrary.simpleMessage("새로운 인터페이스"),
    "newToOrchid" : MessageLookupByLibrary.simpleMessage("오키드가 처음이신가요?"),
    "newWord" : MessageLookupByLibrary.simpleMessage("새로운"),
    "noPacsAvailableAtThisTime" : MessageLookupByLibrary.simpleMessage("현재 사용 가능한 PAC가 없습니다."),
    "noRecentlyDeletedHops" : MessageLookupByLibrary.simpleMessage("최근에 삭제 한 홉이 없습니다 ..."),
    "noSubscriptionCreditsDontExpire" : MessageLookupByLibrary.simpleMessage("구독 중이지 않으며 크레딧이 만료되지 않습니다."),
    "noVersion" : MessageLookupByLibrary.simpleMessage("버전 없음"),
    "notASubscriptionCreditsDontExpire" : MessageLookupByLibrary.simpleMessage("구독이 아니라 크레딧이 만료되지 않습니다."),
    "nothingToDisplayYet" : MessageLookupByLibrary.simpleMessage("표시할 항목이 없습니다. 표시할 항목이 생기면 여기에 트래픽이 표시됩니다."),
    "numHopsConfigured" : m2,
    "ofTraffic" : MessageLookupByLibrary.simpleMessage("교통의"),
    "ok" : MessageLookupByLibrary.simpleMessage("확인"),
    "okButtonTitle" : MessageLookupByLibrary.simpleMessage("확인"),
    "oneClickTheHopBelowThenClickShareOrchidAccount" : MessageLookupByLibrary.simpleMessage("1. 아래 홉을 클릭 한 다음 \'오키드 계정 공유\'를 클릭하고 \'복사\'를 누르십시오."),
    "onetimePurchase" : MessageLookupByLibrary.simpleMessage("일회성 구매"),
    "onlyForTheOrchidApp" : MessageLookupByLibrary.simpleMessage("오키드 앱 전용"),
    "openSourceLicenses" : MessageLookupByLibrary.simpleMessage("오픈 소스 라이선스"),
    "openVPN" : MessageLookupByLibrary.simpleMessage("OpenVPN"),
    "openVPNHop" : MessageLookupByLibrary.simpleMessage("OpenVPN 홉"),
    "optional" : MessageLookupByLibrary.simpleMessage("선택 과목"),
    "orchid" : MessageLookupByLibrary.simpleMessage("Orchid"),
    "orchidAccountInUse" : MessageLookupByLibrary.simpleMessage("사용중인 Orchid 계정"),
    "orchidAddress" : MessageLookupByLibrary.simpleMessage("난초 주소"),
    "orchidConnecting" : MessageLookupByLibrary.simpleMessage("Orchid 연결 중"),
    "orchidDisabled" : MessageLookupByLibrary.simpleMessage("Orchid 비활성화 상태"),
    "orchidDisconnecting" : MessageLookupByLibrary.simpleMessage("Orchid 연결 해제 중"),
    "orchidHop" : MessageLookupByLibrary.simpleMessage("Orchid 홉"),
    "orchidIsOnXdai" : MessageLookupByLibrary.simpleMessage("난초가 xDai에 있습니다!"),
    "orchidIsRunning" : MessageLookupByLibrary.simpleMessage("오키드가 실행되고 있습니다!"),
    "orchidIsStarting" : MessageLookupByLibrary.simpleMessage("Orchid에 연결 중입니다"),
    "orchidIsUniqueAsItSupportsMultipleVPN" : MessageLookupByLibrary.simpleMessage("Orchid는 동시에 다중 VPN 연결을 지원하는 유일한 VPN입니다. 각각의 VPN 연결은 \"홉\"으로 나타납니다.\n\n각 홉은 활성화된 계정이 필요합니다. 아래에서 옵션을 선택해보세요."),
    "orchidOverview" : MessageLookupByLibrary.simpleMessage("Orchid 개요"),
    "orchidRequiresAccountInstruction" : MessageLookupByLibrary.simpleMessage("Orchid를 사용하려면 Orchid 계정이 필요합니다. 아래에 기존 계정을 스캔하거나 붙여넣어서 시작하세요."),
    "orchidRequiresOXT" : MessageLookupByLibrary.simpleMessage("Orchid는 OXT를 필요로합니다"),
    "orchidTokensInTheFormOfAccessCreditsAreUnable" : MessageLookupByLibrary.simpleMessage("액세스 크레딧 형태의 오키드 토큰은 오키드 앱 외부에서 사용하거나 양도 할 수 없습니다."),
    "oxt" : MessageLookupByLibrary.simpleMessage("OXT"),
    "oxtPrice" : MessageLookupByLibrary.simpleMessage("OXT 가격 :"),
    "pacPurchaseWaiting" : MessageLookupByLibrary.simpleMessage("PAC 구매 대기"),
    "password" : MessageLookupByLibrary.simpleMessage("비밀번호"),
    "paste" : MessageLookupByLibrary.simpleMessage("붙여넣기"),
    "pasteAccount" : MessageLookupByLibrary.simpleMessage("계정 붙여 넣기"),
    "pasteAnOrchidKeyFromTheClipboardToImportAll" : MessageLookupByLibrary.simpleMessage("클립 보드에서 Orchid 키를 붙여 넣어 해당 키와 관련된 모든 Orchid 계정을 가져옵니다."),
    "pasteTheCredentialInformationForYourWireguardProviderIntoThe" : MessageLookupByLibrary.simpleMessage("WireGuard 제공 업체의 자격 증명 정보를 위의 필드에 붙여 넣습니다."),
    "pasteYourExistingAccountBelowToAddItAsA" : MessageLookupByLibrary.simpleMessage("아래에 기존 계정을 붙여 넣어 홉으로 추가하십시오."),
    "pasteYourOVPN" : MessageLookupByLibrary.simpleMessage("여기에 OVPN 구성 파일을 붙여넣으세요"),
    "pasteYourWireguardConfigFileHere" : MessageLookupByLibrary.simpleMessage("여기에 WireGuard 구성 파일을 붙여 넣으십시오."),
    "payOnlyForWhatYouUseWithVpnCreditsOnly" : MessageLookupByLibrary.simpleMessage("VPN 크레딧을 통해 VPN이 활성화 된 동안 사용하신 만큼만 지불하세요. 만료 일자나 월별 요금, 수수료는 없습니다."),
    "payPerUseVpnService" : MessageLookupByLibrary.simpleMessage("Pay Per Use VPN 서비스"),
    "preparingPurchase" : MessageLookupByLibrary.simpleMessage("구매 준비"),
    "prices" : MessageLookupByLibrary.simpleMessage("가격"),
    "privacyPolicy" : MessageLookupByLibrary.simpleMessage("개인정보 보호정책"),
    "protectYourTraffic" : MessageLookupByLibrary.simpleMessage("트래픽 보호"),
    "pullToRefresh" : MessageLookupByLibrary.simpleMessage("당겨서 새로 고침하세요."),
    "purchase" : MessageLookupByLibrary.simpleMessage("구매하기"),
    "purchaseError" : MessageLookupByLibrary.simpleMessage("구매 오류"),
    "purchaseOrchidCreditsLinkAnAccountOrOvpnProfileTo" : MessageLookupByLibrary.simpleMessage("오키드 크레딧을 구매하고 계정 또는 OVPN 프로필을 연결하여 시작하십시오."),
    "purchaseOrchidCreditsToConnectWithOrchid" : MessageLookupByLibrary.simpleMessage("오키드 크레딧을 구매하여 오키드와 연결하십시오."),
    "purchasePAC" : MessageLookupByLibrary.simpleMessage("계정 구매 (PAC)"),
    "pushToConnect" : MessageLookupByLibrary.simpleMessage("\'연결하기\'를 눌러 사용하세요."),
    "queryBalances" : MessageLookupByLibrary.simpleMessage("잔액 보기"),
    "rateLimit" : MessageLookupByLibrary.simpleMessage("요율 제한"),
    "readTheGuide" : MessageLookupByLibrary.simpleMessage("가이드 보기"),
    "recentlyDeleted" : MessageLookupByLibrary.simpleMessage("최근 삭제내역"),
    "remove" : MessageLookupByLibrary.simpleMessage("삭제하기"),
    "reset" : MessageLookupByLibrary.simpleMessage("재설정"),
    "retry" : MessageLookupByLibrary.simpleMessage("다시하기"),
    "retryPurchasedPAC" : MessageLookupByLibrary.simpleMessage("구매 한 PAC 재시도"),
    "retryingPurchasedPAC" : MessageLookupByLibrary.simpleMessage("구매 한 PAC 재시도"),
    "save" : MessageLookupByLibrary.simpleMessage("저장하기"),
    "saveButtonTitle" : MessageLookupByLibrary.simpleMessage("저장"),
    "saved" : MessageLookupByLibrary.simpleMessage("저장됨"),
    "scan" : MessageLookupByLibrary.simpleMessage("스캔"),
    "scanOrPasteAccount" : MessageLookupByLibrary.simpleMessage("계정 스캔 또는 붙여 넣기"),
    "scanOrPasteAnOrchidKeyFromTheClipboardTo" : MessageLookupByLibrary.simpleMessage("클립 보드에서 Orchid 키를 스캔하거나 붙여 넣어 해당 키와 관련된 모든 Orchid 계정을 가져옵니다."),
    "scanOrPasteYourExistingAccountBelow" : MessageLookupByLibrary.simpleMessage("아래에서 기존 계정을 스캔하거나 붙여 넣으십시오."),
    "scanOrPasteYourExistingAccountBelowToAddIt" : MessageLookupByLibrary.simpleMessage("아래에서 기존 계정을 스캔하거나 붙여 넣어 홉으로 추가하십시오."),
    "scanYourExistingAccountCreateACustomAccountOrEnter" : MessageLookupByLibrary.simpleMessage("기존 계정을 스캔하거나 사용자 정의 계정을 생성하거나 OVPN 자격 증명을 입력하십시오."),
    "search" : MessageLookupByLibrary.simpleMessage("검색"),
    "seeOrchidcomForHelp" : MessageLookupByLibrary.simpleMessage("도움이 필요하면 orchid.com을 참조하십시오."),
    "seeTheOptions" : MessageLookupByLibrary.simpleMessage("옵션보기"),
    "seeYourActiveAccountBalanceAndBandwidthCostOnThe" : MessageLookupByLibrary.simpleMessage("홈 화면에서 활성 계정 잔액과 대역폭 비용을 확인하세요."),
    "selectYourHop" : MessageLookupByLibrary.simpleMessage("홉 선택"),
    "setUpAccount" : MessageLookupByLibrary.simpleMessage("계정 설정"),
    "setUpYourFirstHopToActivateYourVpnConnection" : MessageLookupByLibrary.simpleMessage("VPN 연결을 활성화하려면 첫 번째 홉을 설정하십시오."),
    "settings" : MessageLookupByLibrary.simpleMessage("설정"),
    "settingsButtonTitle" : MessageLookupByLibrary.simpleMessage("설정"),
    "setup" : MessageLookupByLibrary.simpleMessage("설정"),
    "shareAccountWithUnlimitedDevices" : MessageLookupByLibrary.simpleMessage("무제한 장치와 계정 공유"),
    "shareOrchidAccount" : MessageLookupByLibrary.simpleMessage("Orchid 계정 공유"),
    "shortToMediumTermUsage" : MessageLookupByLibrary.simpleMessage("중장기 사용"),
    "showInstructions" : MessageLookupByLibrary.simpleMessage("설명 표시"),
    "showStatusPage" : MessageLookupByLibrary.simpleMessage("상태 페이지 표시"),
    "signerAddress" : MessageLookupByLibrary.simpleMessage("서명자 주소"),
    "signerKey" : MessageLookupByLibrary.simpleMessage("서명자 키"),
    "sourcePort" : MessageLookupByLibrary.simpleMessage("원본 포트"),
    "spentOnlyWhenTheVpnIsActive" : MessageLookupByLibrary.simpleMessage("VPN이 활성화 된 경우에만 사용됨."),
    "starting" : MessageLookupByLibrary.simpleMessage("실행 중..."),
    "status" : MessageLookupByLibrary.simpleMessage("상태"),
    "talkingToPacServer" : MessageLookupByLibrary.simpleMessage("PAC 서버와 대화"),
    "theCodeYouPastedDoesNot" : MessageLookupByLibrary.simpleMessage("유효한 계정 구성이 아닙니다."),
    "theOrchidStoreIsTemporarilyUnavailablePleaseCheckBackIn" : MessageLookupByLibrary.simpleMessage("Orchid Store를 일시적으로 사용할 수 없습니다. 몇 분 후에 다시 확인하십시오."),
    "theQRCodeYouScannedDoesNot" : MessageLookupByLibrary.simpleMessage("스캔하신 QR 코드는 유효한 계정 구성이 아닙니다."),
    "thereWasAnErrorInPurchasingContact" : MessageLookupByLibrary.simpleMessage("구매하는 중에 오류가 발생했습니다. 오키드 지원 센터에 문의하십시오."),
    "thisCannotBeUndone" : MessageLookupByLibrary.simpleMessage("이 취소 할 수 없습니다."),
    "thisDebugLogIsNonpersistentAndClearedWhenQuittingThe" : MessageLookupByLibrary.simpleMessage("디버그 로그는 지속적이지 않으며 앱 종료 시 삭제됩니다."),
    "thisOrchidAccountIsInUseAndCannotBeDeleted" : MessageLookupByLibrary.simpleMessage("이 Orchid 계정은 사용 중이며 삭제할 수 없습니다."),
    "thisReleaseVPNInstruction" : MessageLookupByLibrary.simpleMessage("해당 릴리스는 Orchid의 고급 VPN 클라이언트로 멀티-홉 및 로컬 트래픽 분석을 지원합니다."),
    "thisWillDeleteRecorded" : MessageLookupByLibrary.simpleMessage("이 작업은 앱 안에 기록된 모든 트래픽 데이터를 삭제합니다."),
    "ticketValue" : MessageLookupByLibrary.simpleMessage("티켓 가치"),
    "time" : MessageLookupByLibrary.simpleMessage("시간"),
    "toGetStartedInstruction" : MessageLookupByLibrary.simpleMessage("VPN을 활성화 하고 시작하기."),
    "toPermanentlyDeleteAHopFromTheListBelowSwipe" : MessageLookupByLibrary.simpleMessage("아래 목록에서 홉을 영구적으로 삭제하려면 왼쪽으로 스 와이프합니다."),
    "toRestoreADeletedHop" : MessageLookupByLibrary.simpleMessage("삭제 된 홉을 복원하려면 :"),
    "traffic" : MessageLookupByLibrary.simpleMessage("트래픽"),
    "trafficListView" : MessageLookupByLibrary.simpleMessage("트래픽 목록 보기"),
    "trafficMonitor" : MessageLookupByLibrary.simpleMessage("트래픽 확인하기"),
    "trafficMonitoringOnly" : MessageLookupByLibrary.simpleMessage("트래픽 모니터링만"),
    "transactionSentToBlockchain" : MessageLookupByLibrary.simpleMessage("블록 체인으로 전송 된 트랜잭션"),
    "transactions" : MessageLookupByLibrary.simpleMessage("업무"),
    "tryOutOrchid" : MessageLookupByLibrary.simpleMessage("오키드를 사용해보세요"),
    "turnOnToActivate" : MessageLookupByLibrary.simpleMessage("Orchid를 실행해 홉을 활성화하고 트래픽을 보호하세요"),
    "twoReturnToTheManageProfileScreenClickNewHop" : MessageLookupByLibrary.simpleMessage("2.‘프로필 관리’화면으로 돌아가‘새 홉’,‘오키드 계정 연결’및‘붙여 넣기’를 차례로 클릭합니다."),
    "unlimitedDevicesAndSharing" : MessageLookupByLibrary.simpleMessage("무제한 기기 및 공유."),
    "username" : MessageLookupByLibrary.simpleMessage("사용자 이름"),
    "version" : MessageLookupByLibrary.simpleMessage("버전"),
    "viewDeletedHops" : MessageLookupByLibrary.simpleMessage("삭제 된 홉보기"),
    "viewOrModifyRateLimit" : MessageLookupByLibrary.simpleMessage("요율 제한수준 확인 및 수정하기."),
    "viewTheDocsForHelpOnThisIssue" : MessageLookupByLibrary.simpleMessage("해당 문서를 참고하시기 바랍니다."),
    "warningExportedConfiguration" : MessageLookupByLibrary.simpleMessage("경고: 내보내기 된 구성사항에 홉에 대한 서명자 개인 키 암호가 포함되어 있습니다. 개인 키가 노출되면 연결된 Orchid 계정 안의 모든 자금을 잃을 수 있습니다."),
    "warningImportedConfiguration" : MessageLookupByLibrary.simpleMessage("경고: 불러온 구성이 앱에 생성된 기존 홉을 대체합니다. 이 장치에서 이전에 생성되거나 가져온 서명자 키는 유지되고, 새로운 홉 생성 시 여전히 접속 가능하지만, OpenVPN 홉 구성을 포함한 다른 모든 구성은 삭제됩니다."),
    "warningThesefeature" : MessageLookupByLibrary.simpleMessage("경고: 이 기능은 고급 사용자를 위한 기능 합니다. 모든 설명을 읽어 보시기 바랍니다."),
    "weAreSorryButThisPurchaseWouldExceedTheDaily" : MessageLookupByLibrary.simpleMessage("죄송합니다. 접속 크레딧 일일 구매 한도를 초과합니다. 나중에 다시 시도해 주세요."),
    "welcomeToOrchid" : MessageLookupByLibrary.simpleMessage("Orchid에 오신 것을 환영합니다"),
    "whatsNewInOrchid" : MessageLookupByLibrary.simpleMessage("Orchid의 새로운 기능"),
    "whoops" : MessageLookupByLibrary.simpleMessage("뭔가 잘못 되었네요!"),
    "wireguard" : MessageLookupByLibrary.simpleMessage("와이어 가드"),
    "wireguardHop" : MessageLookupByLibrary.simpleMessage("와이어 가드 홉"),
    "xdaiAccountsForPastPurchases" : MessageLookupByLibrary.simpleMessage("xDai는 과거 구매에 대해 설명합니다."),
    "youCanNowPurchaseOrchidCreditsOnXdaiStartUsing" : MessageLookupByLibrary.simpleMessage("이제 xDai에서 Orchid 크레딧을 구매할 수 있습니다! \$ 1로 VPN을 사용하세요."),
    "youNeedEthereumWallet" : MessageLookupByLibrary.simpleMessage("Orchid 계정을 생성하려면 이더리움 지갑이 필요합니다."),
    "yourMaxTicketValueIsCurrentlyLimitedByYourBalance" : MessageLookupByLibrary.simpleMessage("현재 잔고에 의해 귀하의 최대 티켓 가격이 제한되었습니다"),
    "yourMaxTicketValueIsCurrentlyLimitedByYourDeposit" : MessageLookupByLibrary.simpleMessage("현재 예치금에 의해 귀하의 최대 티켓 가격이 제한되었습니다"),
    "yourPurchaseIsCompleteAndIsNowBeingProcessedBy" : MessageLookupByLibrary.simpleMessage("구매가 완료되었으며 현재 xDai 블록 체인에 의해 처리되고 있으며 최대 1 분, 때로는 더 오래 걸릴 수 있습니다. 아래로 당겨 새로 고침하면 잔액이 업데이트 된 계정이 아래에 표시됩니다.")
  };
}
